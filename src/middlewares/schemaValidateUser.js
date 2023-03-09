import bcrypt from "bcrypt";
import { db } from "../database/database.js";
import { signinSchema, signupSchema } from "../modules/users.module.js";
import { checkDoubles } from "../repositories/signupRepository.js";

export async function schemaValidateSignup (req, res, next) {
    let user = req.body;

    const {error} = signupSchema.validate(user, {abortEarly: false});

    if (error) {
        const errors = error.details.map((detail) => detail.message);
        return res.status(422).send(errors);
    }

    try {
        const {rows} = await checkDoubles(user);
        if (rows[0].count !== "0") {
            return res.sendStatus(409);
        }
    } catch (error) {
        return res.sendStatus(401);
    }

    const encryptedPassword = bcrypt.hashSync(user.password, 10);

    user = {...user, password: encryptedPassword}
    req.userObject = user;
    next();
    return;
}

export async function schemaValidateSignin (req, res, next) {
    const user = req.body;

    const {error} = signinSchema.validate(user, {abortEarly: false});

    if (error) {
        const errors = error.details.map((detail) => detail.message);
        return res.status(422).send(errors);
    }

    try {
        const {rows} = await db.query(`
        SELECT COUNT
            (*)
        FROM
            users
        WHERE
            email=$1;
        `, [user.email]);
        if (rows[0].count === "0") {
            return res.sendStatus(401);
        }
    } catch (error) {
        return res.sendStatus(401);
    }
    req.userObject = user;
    next();
    return;
}

export async function schemaValidatePassword (req, res, next) {
    let {email, password} = req.userObject;

    try {
        const {rows} = await db.query(`
        SELECT
            *
        FROM
            users
        WHERE
            email=$1;
        `, [email]);

        if (bcrypt.compareSync(password, rows[0].password)) {
            const sessionUser = {
                "email": email,
                "password": rows[0].password
            }
                req.userObject = sessionUser;
                next();
                return;
        } else {
            return res.sendStatus(403)
        }
    } catch (error) {
        return res.sendStatus(401);
    }
}

export async function schemaValidateAuth (req, res, next) {
    const {authorization} = req.headers;
    const token = authorization?.replace("Bearer ", "");

    if (!token) {
        return res.sendStatus(401);
    }

    try {
        const session = await db.query(`
            SELECT
                *
            FROM
                sessions
            WHERE
                token=$1`,
            [token]
        );
        if (session.rows.length === 0) {
            return res.sendStatus(401);
        }
        const userToken = session.rows[0];
        req.userId = userToken.userId;
        next();
        return
    } catch (error) {
        return res.sendStatus(400);
    }
}