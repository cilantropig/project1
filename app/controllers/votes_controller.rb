class VotesController < ApplicationController
  #only admin can delete vote
  before_filter :admin_user, :only => :destroy
  #only sign_in user can vote
  before_filter :authorized
  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(params[:vote])
    @vote.user = current_user
    @vote.post=Post.find(params[:post_id])

    respond_to do |format|
      if @vote.save
        format.html { redirect_to posts_path, notice: 'Vote was successfully created.' }
        format.json { render json: posts_path, status: :created, location: @posts }
      else
        format.html { redirect_to posts_path, :flash => {:alert => "You can only vote once per post!"} }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy

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
