import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import userRouter from "./routes/user.routes.js";

dotenv.config();

const app = express();
app.use(express.json());
app.use(cors());
app.use(userRouter);

const port = process.env.PORT;
app.listen(port, () => console.log(`Server running in port: ${port}`));