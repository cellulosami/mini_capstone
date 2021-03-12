class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, length: { in: 10..500 }

  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :category_products

  def is_discounted?
    if price < 10
      true
    else
      false
    end
  end

  def tax
    (price*0.09).round(2)
  end

  def total
    price + tax
  end

end