import { Router } from "express";
import { signUp } from "../controllers/signup.controller.js";
import { signin } from "../controllers/signin.controller.js";
import { schemaValidatePassword, schemaValidateSignin, schemaValidateSignup } from "../middlewares/schemaValidateUser.js";

const userRouter = Router();

userRouter.post("/signup", schemaValidateSignup, signUp);
userRouter.post("/signin", schemaValidateSignin, schemaValidatePassword, signin);

export default userRouter;