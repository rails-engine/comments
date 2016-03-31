module Comments
  class CommentsController < Comments::ApplicationController
    def index
      @comments = Comment.order("id asc").page(params[:page])
    end

    def new
    end

    def create
      @comment = Comment.new(params[:comment])
      @comment.user = current_user
      if params[:comment][:commentable_type] == "Event" && @comment.has_replied?
        @comment.errors.add(:body, "reply_limit")
      else
        @comment.save
      end
    end

    def destroy
      @comment = Comment.find_by_id(params[:id])
      if @comment && current_user
        if current_user.admin? || @comment.user_id == current_user.id
          @comment.destroy
          @success = true
        end
      end
    end

    private


  end
end
