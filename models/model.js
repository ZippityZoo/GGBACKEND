const db = require('./connectdb');

async function getAllUsers(){
    const sql =`SELECT * FROM users;`;
    return await db.all(sql);
};

async function getUser(user_id){
    const sql =`
    SELECT * FROM users u
        WHERE u.user_id = ?;`;
    return await db.get(sql,user_id);
};
async function loginUser(email,password){
    const sql =`
    SELECT * FROM users u
        WHERE u.email = ? AND u.password = ?;`;
    return await db.get(sql,[email,password]);
};

async function createUser(first_name, last_name, email, tag, password, account_created, standing){
    const sql = `
    INSERT INTO users (first_name, last_name, email, tag, password, account_created, standing)
    VALUES(?,?,?,?,?,?,?)
    ON CONFLICT(user_id)
    DO UPDATE SET user_id = excluded.user_id;
    `;//ON CONFLICT(user_id,email)
    return await db.run(sql,[first_name, last_name, email, tag, password, account_created, standing]);
}

async function insertImage(name, filePath) {
    const imageBuffer = fs.readFileSync(filePath); // Read the image file
    const stmt = db.prepare("INSERT INTO images (name, image) VALUES (?, ?)");
    return await stmt.run(name, imageBuffer);
    //console.log("Image inserted successfully!");
}
async function getAllTourneys(){
    const sql = `
    SELECT * FROM tourneys t;
    `;
    return await db.all(sql);
}
//this gets the tourney but i need the brackets by themselves too
async function getTourney(tourney_id){
    const sql = `
    SELECT * FROM tourneys t
    WHERE t.tourney_id = ?;
    `;
    return await db.get(sql,tourney_id);
}
async function getTourneyBrackets(tourney_id){
    const sql =`
    SELECT * FROM brackets b 
    WHERE b.tourney_id = ?;
    `;
    return await db.all(sql,tourney_id);
}
async function getBracketAttendies(tourney_id){
    const sql = `
    SELECT b.game_name, b.type, u.user_id, u.first_name, u.last_name, u.email, u.tag, u.password, u.account_created, u.standing FROM user_brackets ub
    JOIN brackets b ON  ub.bracket_id = b.bracket_id
    JOIN users u ON ub.user_id = u.user_id
    WHERE b.tourney_id = ?;
    `;
    return await db.all(sql,tourney_id);
};
async function getBracket(bracket_id){
    const sql = `
    SELECT * FROM bracket b
    WHERE b.bracket_id = ?;
    `;
    return await db.get(sql,bracket_id);
}
async function validateUserLogin(email,password){
    const sql =`
    `;
    return await db.get(sql,email,password);
}

module.exports = {
    getAllUsers,
    getUser,
    getAllTourneys,
    //insertImage,
    loginUser,
    createUser,
    getTourney,
    getTourneyBrackets,
    getBracket,
    getBracketAttendies

};
