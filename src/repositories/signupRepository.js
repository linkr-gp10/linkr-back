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