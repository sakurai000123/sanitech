class TReceiveOrder < ApplicationRecord
  has_many :t_reveive_order_details, dependent: :destroy
end
