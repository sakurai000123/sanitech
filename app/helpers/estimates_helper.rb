module EstimatesHelper

  def get_estimates
    @estimates = TEstimate.all.order(id: 'ASC')
  end

  def get_department
    @department = MDepartment.find(@current_user.department_id)
  end

end
