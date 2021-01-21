class MUser < ApplicationRecord
  has_secure_password
  has_one :m_customer
  has_one :m_supplier
end
