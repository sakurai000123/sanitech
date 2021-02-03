class TPurchase < ApplicationRecord
  belongs_to :supplier, class_name: "MSupplier", optional: true
  belongs_to :user, class_name: "MUser", optional: true
  belongs_to :send_order, class_name: "TSendOrder", optional: true
end
