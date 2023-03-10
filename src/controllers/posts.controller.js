import { createPostRepository, deletePostRepository, getPostsRepository } from "../repositories/postRepository.js"

export async function createPost (req, res){
    const { link, content } = req.body

    try {
        await createPostRepository(1, link, content)
    } catch (error) {
        return res.status(500).send(error)
    }

    return res.sendStatus(201)
}

export async function getPost (req, res){
    let posts = []
    const userId = res.locals.user.userId

    try {
       const result =  await getPostsRepository(userId)
       if (result.rowCount > 0) {
        posts = [...result.rows]
       }
    } catch (error) {
        return res.status(500).send(error)
    }

    return res.send(posts)
}

export async function deletePost (req, res){
    const { id } = req.params

    try {
        await deletePostRepository(id)
        res.sendStatus(204)
    } catch (error) {
        return res.status(500).send(error)
    }
}