import {signupRepository} from '../repositories/signupRepository.js'

export async function signUp (req, res) {

    try {
        const result = await signupRepository(req.userObject);
        res.redirect("/");
    } catch (error) {
        res.status(500).send(error.message);
    }
}