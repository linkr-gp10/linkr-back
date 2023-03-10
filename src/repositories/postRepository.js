import {db} from "../database/database.js";

export async function createPostRepository(userId, link, coontent){
    return db.query('INSERT INTO posts ("userId", link, content) VALUES ($1, $2, $3)', [userId, link, content])
}

export async function getPostsRepository(){
    return db.query('SELECT * FROM posts LIMIT 20')
}

export async function deletePostRepository(postId){
    return db.query('DELETE FROM posts WHERE id = $1', [postId])
}