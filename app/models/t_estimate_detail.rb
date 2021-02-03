class TEstimateDetail < ApplicationRecord
  belongs_to :estimate, class_name: "TEstimate", optional: true
end
