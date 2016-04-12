module Comments
  class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_comment, only: [:edit, :update, :destroy]

    # GET /comments
    def index
      @comments = Comment.order('id asc').page(params[:page])
    end

    # POST /comments
    def create
      @comment = Comment.new(comment_params)
      @comment.user = current_user
      @comment.save
    end

    # PATCH/PUT /comments/1
    def update
      @success = @comment.update(comment_params)
    end

    def reply
      @parent = Comment.find(params[:id])
      @comment = Comment.new(parent_id: @parent.id, commentable: @parent.commentable)
    end

    # DELETE /comments/1
    def destroy
      if @comment.user_id != current_user.id
        raise ActiveRecord::RecordNotFound
      end

      @comment.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_comment
        @comment = Comment.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def comment_params
        params.require(:comment).permit(:commentable_type, :commentable_id, :parent_id, :body)
      end
  end
end
