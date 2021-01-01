class User < ApplicationRecord
  has_secure_password
  validate :add_errors
    def add_errors
      # 氏名
      if name.blank?
        errors.add("氏名", ": 入力してください")
      elsif name.length > 255
        errors.add("氏名", ": 名前は255文字以内で入力してください")
      end
      # 社員no
      if employee_no.blank?
        errors.add("社員no", ": 入力してください")
      end
    end
end