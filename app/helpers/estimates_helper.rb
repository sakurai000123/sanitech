module EstimatesHelper

  def get_estimates
    @estimates = TEstimate.all.order(id: 'ASC')
  end

end
