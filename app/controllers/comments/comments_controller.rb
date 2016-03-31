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

    # DELETE /comments/1
    def destroy
      @comment.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_comment
        @comment = Comment.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def comment_params
        params.require(:comment).permit(:commentable_type, :commentable_id, :body)
      end
  end
end
