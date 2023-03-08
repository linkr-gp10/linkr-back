import {db} from "../database/database.js";

export async function signinRepository (user) {
    const {email} = user;

    return db.query(`
        SELECT *
        FROM users
        WHERE email=$1
        `, [email]);
}

export async function passwordCheck (id, tokenNum) {
    return db.query(`
            INSERT INTO sessions
                ("userId", token)
            VALUES
                ($1, $2)
            `, [id, tokenNum]);
}