class TReceiveOrderDetail < ApplicationRecord
  belongs_to :recieve_order, class_name: "TReceiveOrder", optional: true
end
