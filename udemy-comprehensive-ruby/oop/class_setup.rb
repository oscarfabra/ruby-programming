class ApiConnector
  attr_accessor :title, :description, :url

  # Initializer with named arguments
  def initialize(title:, description:, url: "google.com")
    @title = title
    @description = description
    @url = url
    secret_method
  end

  # def test_method
  #   puts "testing method call"    
  # end

  # def testing_initializer
  #   puts @title
  #   puts @description
  #   puts @url    
  # end

  def api_logger
    puts "API Connector starting..."
  end

  private
    def secret_method
      puts "Secret message from inside the parent class..."
    end
end

# api = ApiConnector.new
# api.url = "http://google.com"
# puts api.url

# api.test_method

# api = ApiConnector.new(description: "My cool description", title: "My title", url: "yahoo.com")
# api.testing_initializer

class SmsConnector < ApiConnector
  def send_sms
    puts "Sending sms..."
  end

  def api_logger
    super
    # puts "SMS API Connector starting..."
  end
end

class PhoneConnector < ApiConnector
  def send_phone_call
    puts "Sending phone call..."
  end
end

class MailConnector < ApiConnector
  def send_email
    puts "Sending email..."
  end
end

sms = SmsConnector.new(description: "My cool description", title: "My title", url: "yahoo.com")
# phone = PhoneConnector.new(description: "My cool description", title: "My title", url: "yahoo.com")
# email = MailConnector.new(description: "My cool description", title: "My title", url: "yahoo.com")

# sms.send_sms
# phone.send_phone_call
# email.send_email

sms.api_logger