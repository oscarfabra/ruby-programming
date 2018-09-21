class Invoice
  # Class method
  def self.print_out
    puts "Printed out invoice"
  end

  # Instace method
  def convert_to_pdf
    puts "Converted to PDF"
  end
end

i = Invoice.new
i.convert_to_pdf