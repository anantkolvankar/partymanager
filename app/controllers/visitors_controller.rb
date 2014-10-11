class VisitorsController < ApplicationController
before_filter :authenticate_user!

  def index
    @birthday_person = User.has_birthday Date.today,current_user.id
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
    @party = Party.find(params[:invite_id])
    @pizza_product = Product.find_by(name:'Pizza')
    if params[:product_id].to_i == @pizza_product.id
      @party.update_attributes(product_id: params[:product_id], bid: params[:birthday_id],invitee_id: current_user[:id],extra: '')
      redirect_to visitors_path,:notice =>'You have added your order successfully'
    else
      if @party.update_attributes(product_id: params[:product_id], bid: params[:birthday_id],invitee_id: current_user[:id],extra: params[:extra])
        redirect_to visitors_path,:notice =>'You have added your order successfully'
      else
        redirect_to visitors_path,:alert =>"Error updating your order - #{@party.errors}"
      end
    end
  end
  
  private

  def get_party bid, contributed
    @contribution = Party.find_by_bid_and_invitee_id(bid,current_user.id)
    @contribution.is_contributed =  contributed
    @contribution.save
    redirect_to visitors_path
  end
end
