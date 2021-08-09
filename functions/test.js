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

	const all = await notion.databases.query({
		database_id: process.env.DATABASE_ID,
		// filter: {
		// 	property: "Target",
		// 	relation: {
		// 			is_not_empty: true
		// 	}
		// }
	});
	
	return {
		statusCode: 200,
		body: JSON.stringify(myGoals),
		headers: {
	  	'Content-Type': 'application/json; charset=utf-8',
		}
	};
}