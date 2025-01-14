const sqlite3 = require('better-sqlite3');
//const path = require("path");
//const db = new mysql(path.join(__dirname, "../", "ggdatabase.db"));
//const dbPath = '../ggdatabase.db'; 

const path = require("path");
const db = new sqlite3(path.join(__dirname, "../", "ggdatabase2.db"));

function all(sql, ...params) {
    //console.log('all called');
    return db.prepare(sql).all(...params);
}
function get(sql, ...params) {
    return db.prepare(sql).get(...params);
}
function run(sql, ...params) {
    return db.prepare(sql).run(...params);
}



//connection.end();

module.exports = {
    //connectDb,
    all,
    get,
    run

};