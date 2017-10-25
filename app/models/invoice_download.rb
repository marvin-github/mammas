class InvoiceDownload < ApplicationRecord

  def self.to_csv

    attributes = %w{ start_date merchant_name invoice_id total}

    CSV.generate(headers: true) do |csv|
      csv << attributes
      puts 'zzz-InvoiceDownload.to_cvs'
      all.each do |invoice|
        csv << attributes.map{ |attr| invoice.send(attr) }
      end
    end
  end

  

end