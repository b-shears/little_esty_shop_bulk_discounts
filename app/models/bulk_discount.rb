class BulkDiscount < ApplicationRecord
  validates :percentage_discount, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 99 }
  validates :quantity, presence: true, numericality: true
  belongs_to :merchant

  
end
