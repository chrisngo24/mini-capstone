class Order < ApplicationRecord
  belongs_to :user #(direct relationship)
  has_many :carted_products
  has_many :products, through: :carted_products
  # has_many :users, through: :carted_products (redundant of belongs_to :user)
end
