class ReplyVotesController < ApplicationController
  #only admin can delete vote
  before_filter :admin_user, :only => :destroy
  #only sign_in user can vote
  before_filter :authorized

  # POST /reply_votes
  # POST /reply_votes.json
  def create
    @reply_vote = ReplyVote.new(params[:reply_vote])
    @reply_vote.user = current_user
    @reply_vote.reply=Reply.find(params[:reply_id])

    respond_to do |format|
      if @reply_vote.save
        format.html { redirect_to posts_path, notice: 'Reply vote was successfully created.' }
        format.json { render json: posts_path, status: :created, location: @reply_vote }
      else
        format.html { redirect_to posts_path, :flash => {:alert => "You can only vote once per reply!"} }
        format.json { render json: @reply_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reply_votes/1
  # DELETE /reply_votes/1.json
  def destroy
    @reply_vote = ReplyVote.find(params[:id])
    @reply_vote.destroy

    respond_to do |format|
      format.html { redirect_to posts_path }
      format.json { head :ok }
    end
  end

  # methods used for before_filter
  private
  def admin_user
    redirect_to(root_path) unless user_signed_in? and current_user.admin?
  end

  def authorized
    redirect_to(root_path) unless user_signed_in?
  end

end
