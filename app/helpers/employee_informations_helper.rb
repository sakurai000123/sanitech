module EmployeeInformationsHelper
  def get_user_by_id(id)
    @user = MUser.find_by(id: id)
  end
  
  def get_users
    @users = MUser.all.order(id: 'ASC')
  end

  def blood_type_list
    return [["A", "A"], ["B", "B"], ["O", "O"], ["AB", "AB"]]
  end
end
