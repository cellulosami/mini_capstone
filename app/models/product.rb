class Product < ApplicationRecord
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
