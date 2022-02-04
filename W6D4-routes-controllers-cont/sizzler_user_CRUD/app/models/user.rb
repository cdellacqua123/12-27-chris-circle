# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  email      :string
#  country    :string           not null
#  age        :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    validates :username, :country, :age, presence: true
    validates :username, uniqueness: true

    has_many :items,
        primary_key: :id,
        foreign_key: :seller_id,
        class_name: :Item
end
