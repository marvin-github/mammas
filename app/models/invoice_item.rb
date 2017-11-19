class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :item
  validates :quantity, presence: true, numericality: { only_integer: true }

  def self.to_csv
    #start_date merchant_name,
    attributes = %w{ start_date merchant_name invoice_id cost}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |invoice|
        csv << attributes.map{ |attr| invoice.send(attr) }
      end
    end
  end

  def merchant_name
    "#{invoice.merchant.merchant_name}"
  end

  def start_date
    "#{invoice.start_date.strftime("%Y-%m-%d")}"
  end
end