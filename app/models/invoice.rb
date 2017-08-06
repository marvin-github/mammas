class Invoice < ApplicationRecord
  belongs_to :merchant
  belongs_to :user
  validates :merchant, presence: {message: "Must select merchant"}
  validates :debit, numericality: { message: "%{value} seems wrong" }, allow_nil: true
  validates :credit, numericality: { message: "%{value} seems wrong" }, allow_nil: true
  validates :quantity, numericality: { message: "%{value} seems wrong" }, allow_nil: true

  def self.to_csv
    attributes = %w{id start_date merchant_name price extended_cost extra_cases description upc quantity user_name}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |invoice|
        csv << attributes.map{ |attr| invoice.send(attr) }
      end
    end
  end

  def merchant_name
      "#{merchant.merchant_name}"
  end

  def user_name
    "#{user.name}"
  end
end
