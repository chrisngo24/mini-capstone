class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: {in: 10..500 }
  has_many :orders

  belongs_to :supplier
    # def supplier
    #   Supplier.find_by(id: supplier_id)
    # end

  has_many :images
    # def images
    #   Image.where(product_id: id)
    # end

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
