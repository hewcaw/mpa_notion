const dotenv = require('dotenv').config();
const { Client } = require('@notionhq/client');

const notion = new Client({
	auth: process.env.TOKEN
});

exports.handler = async function(event, context) {
	const goals = await notion.databases.query({
		database_id: process.env.DATABASE_ID,
		filter: {
			property: "Target",
			relation: {
					is_not_empty: true
			}
		},
		sorts: [
	    {
	      property: "Goal Priority",
	      direction: "ascending"
	    }
	  ]
	});
	
	// const data = {}
	
	const data = await Promise.all(goals.results.map(async page => {
		const targets = await getTargets(page.properties.Target.relation)

		return {
			name: page.properties.Name.title[0].plain_text,
			description: page.properties.Description.rich_text[0].plain_text,
			category: page.properties.Category.multi_select[0].name,
			categoryColor: page.properties.Category.multi_select[0].color,
			date: page.properties.Date.date.end,
			targets: await Promise.all(targets.map(async target => {
				const blocks = await getBlocks(target.properties.Task.relation)
				var tasksProgress = blocks.map((item, index) => calculateTaskProgress(item.results, 1 / target.properties.Task.relation.length))
				var checks = tasksProgress.filter((task) => task.isCompleted).length;
				
				return {
					name: target.properties.Name.title[0].plain_text,
					status: target.properties.Status ? target.properties.Status.select.name : '',
					checks: checks,
					total: tasksProgress.length,
					tasks: tasksProgress,
					// taskIds: target.properties.Task.relation,
					// tasks: tasksProgress,
					// blocks,
				}
			})),
			// targets
		}
	}));
	
	return {
		statusCode: 200,
		body: JSON.stringify(data),
		headers: {
			'Cache-Control': 'public, s-maxage=1800',
	  	'Content-Type': 'application/json; charset=utf-8',
		}
	};
}

async function getTargets(relationIds) {
	return Promise.all(relationIds.map(async relation => {
		return await notion.pages.retrieve({
			page_id: relation.id
		})
	}))
}

async function getBlocks(relationIds) {
	return Promise.all(relationIds.map(async relation => {
		return await notion.blocks.children.list({
			block_id: relation.id,
			page_size: 25,
		})
	}))
}

function calculateTaskProgress(blocks, base) {
	var checks = 0
	var total = 0

	// TODO: Use "for" instead because "forEach" can use "break"; Later, WTF?
	blocks.forEach((item, index) => {
		if (item.type == 'to_do') {
			total = total + 1
			if (item.to_do.checked) checks = checks + 1
		} 
	})
	
	return {
		checks: checks,
		total: total,
		isCompleted: (checks == total) ? true : false,
	}
}

// exports.handler = async function(event, context, callback) {
//     callback(null, {
//         statusCode: 200,
//         body: JSON.stringify({message: 'Hello World'}),
//         headers: {
//             // 'Content-Type': 'application/rss+xml; charset=utf-8',
//             // https://stackoverflow.com/questions/24604466/the-character-encoding-of-the-plain-text-document-was-not-declared-mootool-scr
//             'Content-Type': 'text/xml; charset=utf-8',
//         }
//     });
// }

