class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.invite_members current_user.id
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def update_invites
    invite_ids = params[:invitee_ids]
    invite_ids.each do |invite|
      Party.find_or_create_by(bid: current_user.id,invitee_id: invite)
      # binding.pry
    end
    redirect_to users_path,notice: 'You have invited users successfully.'
  end
  
end
