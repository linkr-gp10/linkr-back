import bcrypt from "bcrypt";
import { signupSchema } from "../modules/users.module.js";
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