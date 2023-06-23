# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Seed for Users
users = [
  {
    name: "John Doe",
    photo: "john",
    bio: "Hello, I'm John Doe!",
    posts_counter: 0
  },
]

users.each { |user| User.create(user) }

# Seed for Posts
posts = [
  {
    title: "First Post",
    text: "This is my first post!",
    comments_counter: 0,
    likes_counter: 0,
    author_id: User.first.id
  },
  {
    title: "Awesome Day",
    text: "Had an awesome day today!",
    comments_counter: 0,
    likes_counter: 0,
    author_id: User.last.id
  },
  # Add more posts if needed
]

posts.each { |post| Post.create(post) }

# Seed for Comments
comments = [
  {
    text: "Great post!",
    author_id: User.first.id,
    post_id: Post.first.id
  },
  {
    text: "I agree with you.",
    author_id: User.last.id,
    post_id: Post.first.id
  },
  # Add more comments if needed
]

comments.each { |comment| Comment.create(comment) }

# Seed for Likes
likes = [
  {
    author_id: User.first.id,
    post_id: Post.last.id
  },
  {
    author_id: User.last.id,
    post_id: Post.last.id
  },
  # Add more likes if needed
]

likes.each { |like| Like.create(like) }
