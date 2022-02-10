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
require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
