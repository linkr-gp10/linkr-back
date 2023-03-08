import {v4 as uuidV4} from "uuid";
import { passwordCheck, signinRepository } from "../repositories/signinRepository.js";

export async function signin (req, res) {
    const {password} = req.userObject;
    const tokenNum = uuidV4();
    const token = {"token": tokenNum};

    try {
        const {rows} = await signinRepository(req.userObject);
        if (rows[0].count !== "0") {
            if (rows[0].password === password) {
                await passwordCheck(rows[0].id, tokenNum);
                res.status(200).send(token);
            } else {
                res.sendStatus(403);
            }
        } else {
            res.status(401).send("Invalid or wrong e-mail.");
        }
    } catch (err) {
        res.status(500).send(err.message);
    }
}