import { Router } from "express";
import { signUp } from "../controllers/signup.controller.js";
import { schemaValidateSignup } from "../middlewares/schemaValidateUser.js";

const userRouter = Router();

userRouter.post("/signup", schemaValidateSignup, signUp);

export default userRouter;