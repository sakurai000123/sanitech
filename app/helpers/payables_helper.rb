module PayablesHelper

  def get_payables
    @payables = TAccountPayable.all
  end

end
