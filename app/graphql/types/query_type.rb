module Types
  QueryType = GraphQL::ObjectType.define do
    name 'QueryType'

    CommentType = GraphQL::ObjectType.define do
      name 'Comment'

      field :id, types.ID
      field :body, types.String
    end

    PostType = GraphQL::ObjectType.define do
      name 'Post'

      field :id, types.ID
      field :title, types.String
      field :body, types.String

      connection :comments, Types::CommentType.connection_type do
        description 'All of the comments for a given post'
      end
    end

    connection :posts, Types::PostType.connection_type do
      description 'All of the posts'
      resolve ->(_obj, _args, _ctx) {
        Post.includes(:comments)
      }
    end
  end
end
