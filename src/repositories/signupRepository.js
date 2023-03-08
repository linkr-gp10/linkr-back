import {db} from "../database/database.js";

export async function signupRepository (user) {
    const {email, password, username, imageUrl} = user;

    return db.query(`
        INSERT INTO users
            (email, password, username, "imageUrl")
        VALUES
            ($1, $2, $3, $4);
    `, [email, password, username, imageUrl]);
}

export async function checkDoubles (user) {
    const {email} = user;

    return db.query(`
        SELECT COUNT
            (*)
        FROM
            users
        WHERE
            email=$1;
    `, [email]);
}