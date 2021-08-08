const dotenv = require('dotenv').config();
const { Client } = require('@notionhq/client');

const notion = new Client({
	auth: process.env.TOKEN
});

exports.handler = async function(event, context) {
	const myGoals = await notion.databases.query({
		database_id: process.env.DATABASE_ID,
		filter: {
			property: "Target",
			relation: {
					is_not_empty: true
			}
		}
	});

	// console.log(notion.databases);

	return {
		statusCode: 200,
		// body: JSON.stringify({message: "Hello World"}),
		body: JSON.stringify({message: myGoals}),
		// headers: {
				// 'Content-Type': 'application/json; charset=utf-8',
		// }
	};
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

