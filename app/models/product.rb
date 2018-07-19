class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: {in: 5..500 }
  # has_many :orders #(removed from table)

  belongs_to :supplier
    # def supplier
    #   Supplier.find_by(id: supplier_id)
    # end

  has_many :images
    # def images
    #   Image.where(product_id: id)
    # end

  has_many :carted_products
  has_many :users, through: :carted_products
  has_many :orders, through: :carted_products

  def is_discounted?
    price < 2
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  def supplier
    Supplier.find_by(id: supplier_id)
  end

  def images
    Image.where(product_id: id)
  end
end
