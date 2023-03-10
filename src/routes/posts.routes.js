import { Router } from "express";
import { createPost, deletePost, getPost } from "../controllers/posts.controller";

const postRouter = Router()

postRouter.post("/timeline", createPost)
postRouter.get("/timeline", getPost)
postRouter.delete("/timeline/:id", deletePost)

export default postRouter;