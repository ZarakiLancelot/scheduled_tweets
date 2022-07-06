# == Schema Information
#
# Table name: users
#
#  id                      :integer          not null, primary key
#  email                   :string
#  password_digest         :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
#  password                :string virtual
#  password_confirmation   :string virtual
#
class User < ApplicationRecord
    has_secure_password
end
