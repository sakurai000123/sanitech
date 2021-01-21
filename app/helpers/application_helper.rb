module ApplicationHelper
  # 未選択
  def select_blank
    '選択して下さい'
  end

  # 社員選択リスト
  def users_list
    data_list = MUser.all.order(id: 'ASC')
    list = []
    data_list.each{ |data| list.push([data.id + ':' + data.user_name, data.id]) }
    return list
  end

  # 部門選択リスト
  def departments_list
    data_list = MDepartment.all.order(id: 'ASC')
    list = []
    data_list.each{ |data| list.push([data.id + ':' + data.department_name, data.id]) }
    return list
  end

  # 権限選択リスト
  def authoritys_list
    data_list = MAuthority.all.order(id: 'ASC')
    list = []
    data_list.each{ |data| list.push([data.id + ':' + data.authority_name, data.id]) }
    return list
  end

  # 入金口座選択リスト
  def deposit_accounts_list
    data_list = MDepositAccount.all.order(id: 'ASC')
    list = []
    type_hash = { "1" => "普通", "2" => "当座", "3" => "その他" }
    data_list.each do |data|
      info = data.id + ':'  + data.deposit_account_name + ' ' + type_hash[data.account_type_code] + ' ' + data.account_number
      list.push([info, data.id])
    end
    return list
  end

  # 支払条件選択リスト
  def payment_category_code_list
    return [['1:現金', '1']]
  end

  # 締日選択リスト
  def close_date_code_list
    return [['1:末日', '1']]
  end

  # 支払日選択リスト
  def payment_date_code_list
    return [['1:翌末日', '1']]
  end
end
