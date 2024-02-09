class CommentsController < ApplicationController

  def add
    id = params.fetch("input_photo_id")
    author = params.fetch("input_author_id")
    comment_body = params.fetch("input_comment")

    comment = Comment.new

    comment.photo_id = id

    if author == nil or comment_body == nil
      redirect_to("/photos/" + id)
    else
      comment.author_id = author
      comment.body = comment_body
      comment.save
      redirect_to("/photos/" + id )
    end

  end
end
