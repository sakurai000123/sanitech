module ReceivablesHelper

def get_receivables
  @receivables = TAccountReceivable.all
end



end
