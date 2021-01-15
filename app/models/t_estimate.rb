class TEstimate < ApplicationRecord
  has_many :t_estimate_details, dependent: :destroy
end
