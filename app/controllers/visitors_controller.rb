class VisitorsController < ApplicationController

  def index
    @birthday_person = User.has_birthday Date.today
    @my_invites = Party.has_invited current_user.id
    @products = Product.all
  end

  def add_contribution
    get_party params[:bid], true
  end

  def revert_contribution
    get_party params[:bid], false
  end

  def add_order
  end
  
  private

  def get_party bid, contributed
    @contribution = Party.find_by_bid_and_invitee_id(bid,current_user.id)
    @contribution.is_contributed =  contributed
    @contribution.save
    redirect_to visitors_path
  end
end
