class TReceiveOrderDetail < ApplicationRecord
  belongs_to :receive_order, class_name: "TReceiveOrder", optional: true
end
