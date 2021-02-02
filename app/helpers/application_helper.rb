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

  # 得意先選択リスト
  def customers_list
    data_list = MCustomer.all.order(id: 'ASC')
    list = []
    data_list.each{ |data| list.push([data.id + ':' + data.customer_name, data.id]) }
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

  # 支払条件選択リスト
  def payment_category_code_list
    return [['1:現金', '1'], ['2:従来通り', '2']]
  end

  # 締日選択リスト
  def close_date_code_list
    return [['1:末日', '1']]
  end

  # 支払日選択リスト
  def payment_date_code_list
    return [['1:翌末日', '1']]
  end

  # 納期選択リスト
  def delivery_date_category_code_list
    return [['1:実働約2～3日', '1']]
  end

  # 受渡場所選択リスト
  def delivery_place_code_list
    return [['1:御社', '1']]
  end

  # 有効期限選択リスト
  def expiration_code_list
    return [['1:1ヶ月', '1']]
  end

  # 見積選択リスト
  def estimates_list
    data_list = TEstimate.all.order(id: 'ASC')
    list = []
    data_list.each{ |data| list.push([data.id + ':' + data.estimate_name, data.id]) }
    return list
  end
  
  # 口座区分選択リスト
  def account_category_code_list
    return [['1:銀行', '1'], ['2:ゆうちょ', '2'], ['3:農協', '3']]
  end

  # 口座種別選択リスト
  def account_type_code_list
    return [['1:普通', '1'], ['2:当座', '2'], ['3:その他', '3']]
  end
  
end
