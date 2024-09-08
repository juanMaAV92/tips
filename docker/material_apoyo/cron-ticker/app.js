

const cron = require('node-cron');
const { syncDB } = require('./tasks/sync-db');

console.log('Starting cron ticker');

cron.schedule('*/5 * * * * *', syncDB);



