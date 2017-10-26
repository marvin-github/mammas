class InvoiceDownload < ApplicationRecord

  def self.to_csv

    attributes = %w{ merchant_name store_number total start_date invoice_id }

    CSV.generate(headers: true) do |csv|
      csv << attributes
      puts 'zzz-InvoiceDownload.to_cvs'
      all.each do |invoice|
        csv << attributes.map{ |attr| invoice.send(attr) }
      end
    end
  end



end