class Invoice < ApplicationRecord
  belongs_to :merchant
  belongs_to :user
  has_many :invoice_items
  has_many :items, through: :invoice_items
  validates :merchant_id, presence: {message: "Must select merchant"}



  def self.to_csv
    attributes = %w{id start_date merchant_name cost}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |invoice|
        csv << attributes.map{ |attr| invoice.send(attr) }
      end
    end
  end
  def cost
    "#{invoice_items.cost}"
  end

  def merchant_name
      "#{merchant.merchant_name}"
  end

  def user_name
    "#{user.name}"
  end
end
