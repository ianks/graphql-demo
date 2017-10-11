Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createPost, Types::PostType do
    description 'Create a new post'

    argument :title, !types.String
    argument :body, !types.String

    resolve ->(obj, args, ctx) {
      Post.create(title: args[:title], body: args[:body])
    }
  end

  field :commentOnPost, Types::CommentType do
    description 'Comment on a post'

    argument :postId, !types.ID
    argument :body, !types.String

    resolve ->(obj, args, ctx) {
      Comment.create(post_id: args[:postId], body: args[:body])
    }
  end
end
