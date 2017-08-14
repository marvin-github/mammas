class InvoiceMailer < ApplicationMailer
  default from: 'konwinski1960@gmail.com'

  def welcome_email(invoice)
    print '************'
    puts invoice
    @invoice = invoice
    #@url  = # generate confirmation url
        mail(to: 'mkonwinski@icloud.com', subject: "welcome!")
  end
end