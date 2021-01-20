class MUser < ApplicationRecord
  has_secure_password
  has_one :m_customer
end
