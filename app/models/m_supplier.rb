class MSupplier < ApplicationRecord
  belongs_to :charge, class_name: "MUser"
end
