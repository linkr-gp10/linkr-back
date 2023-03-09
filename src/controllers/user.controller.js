import { db } from "../database/database.js";

export async function userInfo(req, res) {
    const userId = req.userId;


    try {
        const userInfo = await db.query(`
        SELECT
            *
        FROM
            users
        WHERE
            id=$1
        `, [userId]);
        return res.status(200).send({username: userInfo.rows[0].username, imageUrl: userInfo.rows[0].imageUrl});
    } catch (error) {
        console.log(error);
        return res.sendStatus(400);
    }
}