class Party < ActiveRecord::Base

  #Associations
  belongs_to :product
  belongs_to :birthday,:foreign_key => "bid", :class_name => "User"
  belongs_to :invitee,:foreign_key => "invitee_id", :class_name => "User"

  #Validations
  validates :extra, presence: { :message => "field is required" }, unless: :is_pizza_product?

  #Scope
  scope :has_invited,-> (user_id) { where('invitee_id=?',user_id) }

  #methods
  def is_contributed?
    is_contributed == true
  end

  def is_pizza_product?
    unless product.blank?
      product.name == 'Pizza'
    else
      return true
    end
  end
end
