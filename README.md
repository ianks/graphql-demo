# GraphQL Demo

## Getting started

1. Make sure you have a modern-ish version of Ruby (>= 2.2.3)
2. Install the deps by running: `bin/setup`
3. Start the server: `bin/rails server`


## Run some queries

1. After starting the server, navigate to [http://localhost:3000/graphiql](http://localhost:3000/graphiql)

### Listing all posts

```graphql
{
  posts {
    edges {
      node {
        title
        body
        id
      }
    }
  }
}
```

### Creating a post

```graphql
mutation {
  createPost(title: "Hello world!", body: "GraphQL is kewl") {
    id
    title
    body
  }
}
```

### Commenting on a post

```graphql
mutation {
  commentOnPost(postId: 1, body: "Such an engaging post!") {
    id
    body
  }
}
```

### Listing all posts (with comments)

```graphql
{
  posts {
    edges {
      node {
        comments {
          edges {
            node {
              id
              body
            }
          }
        }
	title
        body
        id
      }
    }
  }
}
```
