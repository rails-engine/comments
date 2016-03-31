module Comments
  module ViewHelpers
    extend ActiveSupport::Concern

    included do
    end

    def comments_tag(commentable, opts = {})
      comments = Comment.where(commentable: commentable).order("id asc").page(params[:page])

      render partial: '/comments/comments', locals: { commentable: commentable, comments: comments }
    end
  end
end
