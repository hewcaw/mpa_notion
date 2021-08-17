const dotenv = require('dotenv').config();
const fetch = require('node-fetch');
const moment = require('moment');

const url = `https://reports.api.clockify.me/v1/workspaces/${process.env.WORKSPACE_ID}/reports/summary`;

exports.handler = async function(event, context) {
  return fetch(url, {
    method: 'POST',
    body: JSON.stringify(getPayload()),
    headers: {
      'Content-Type': 'application/json',
      'X-Api-Key': process.env.CLOCKIFY_KEY,
    },
  })
  .then(response => response.json()) 
  .then(json => {
    json.groupOne.forEach(category => {
      addMissingDates(category.children)
    });

    return {
      statusCode: json.code ? json.code : 200,
      body: JSON.stringify(json),
      headers: {
        'Cache-Control': 'public, s-maxage=1800',
        'Content-Type': 'application/json; charset=utf-8',
      }
    }
  })
  .catch(err => console.log(err))
}

function getPayload() {
  const today = new Date()
  const prior30 = new Date().setDate(today.getDate() - 30)
  const prior1 = new Date().setDate(today.getDate() - 0)
  
  return {
    dateRangeStart: new Date(prior30).toISOString(),
    dateRangeEnd: new Date(prior1).toISOString(),
    summaryFilter: {
      groups: [
        "CLIENT",
        "DATE"
      ],
      // sortColumn: "GROUP"
    },
    // sortOrder: "DESCENDING",
    amountShown: "HIDE_AMOUNT",
    timeZone: "Asia/Ho_Chi_Minh",
  };
}

// TODO: Get rid of moment.js - https://stackoverflow.com/a/63490548/16553764
// Add Missing Dates to Datapoints (it also sorts the dates) - https://jsfiddle.net/hwkzsye7
function addMissingDates(children) {
  // var chart = [
  //   { x: '2012-01-01', y: 26},
  //   { x: '2012-01-3', y: 38},
  //   { x: '2012-01-4', y: 43},
  //   { x: '2012-01-7', y: 29}
  // ];


  /* addMissingDps(chart); */
  /* chart.render(); */

  // addMissingDps(report);
  // console.log(report);

  // function addMissingDps(report) {	
  
  // for(var i = 0; i < chart.options.data.length; i++) {
    
  // var newDps = [];    
  var dps = children;
  
  // Check and add start and end date
  const today = new Date()
  const start = new Date().setDate(today.getDate() - 30)
  const end = new Date().setDate(today.getDate() - 0)
  if (Date.parse(dps[0].name) !=  start) dps.unshift({name: moment(start).format('YYYY-MM-DD'), duration: 0});
  if (Date.parse(dps[dps.length - 1].name) !=  end) dps.push({name: moment(end).format('YYYY-MM-DD'), duration: 0});

  /* Find Missing Dates in an array - https://stackoverflow.com/a/40655233 */
  var missingDates = dps.sort(function(a,b){
    return Date.parse(a.name) - Date.parse(b.name);
  }).reduce(function(hash){
    return function(p,c){
      var missingDaysNo = (Date.parse(c.name) - hash.prev) / (1000 * 3600 * 24);
      if(hash.prev && missingDaysNo > 1) {
        for(var i=1;i<missingDaysNo;i++)
          p.push(new Date(hash.prev+i*(1000 * 3600 * 24)));
      }
      hash.prev = Date.parse(c.name);
      return p;
    };
  }(Object.create(null)),[]);

  /* Add missing dates to dataPoints */    
  for(var j = 0; j < missingDates.length; j++) {
    dps.push({name: moment(missingDates[j]).format('YYYY-MM-DD'), duration: 0})      
  }    

  /* Sort newly added dates - https://stackoverflow.com/a/10124053 */
  dps.sort(function(a,b){      
    return Date.parse(a.name) - Date.parse(b.name);
  });
      
  // return dps

  // ------------------------------------------------------------------------

  // var report = [
  //   {"_id":"2021-08-13","duration":3900,"name":"2021-08-13","children":null},
  //   {"_id":"2021-08-12","duration":12840,"name":"2021-08-12","children":null},
  //  /*  {"_id":"2021-08-11","duration":7020,"name":"2021-08-11","children":null},
  //   {"_id":"2021-08-10","duration":11880,"name":"2021-08-10","children":null}, */
  //   {"_id":"2021-08-09","duration":16620,"name":"2021-08-09","children":null},
  //   {"_id":"2021-08-08","duration":13200,"name":"2021-08-08"},
  // ]
  
  // var c = [];
  // for (var i = 0; i < report.length - 1; i++) {
  //   const current = moment('2021-08-13');
  //   // c = current.day()
  //   // const range = current.day - moment(report[i + 1].name).day;
  //   // h = current.day
  //   c.push({"day": current.date()});
  //   // if (range > 1) {
  //   //   Array.from({length: range}, (r, j) => report[i + 1 + j] = {name: current.add(j + 1, days), duration: 0});
  //   // }
  // }
  // return c

  // return report
}