class Validate

  # 携帯電話
  MOBILE_PHONE_NUMBER_REGEX = /\A0[5789]0[-]?\d{4}[-]?\d{4}\z/
  # メールアドレス
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

end