# == Schema Information
#
# Table name: items
#
#  id                  :bigint           not null, primary key
#  product_name        :string           not null
#  product_description :text
#  price               :float            not null
#  seller_id           :integer          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class Item < ApplicationRecord
    validates :product_name, :price, presence: true

    belongs_to :seller,
        primary_key: :id,
        foreign_key: :seller_id,
        class_name: :User
end
