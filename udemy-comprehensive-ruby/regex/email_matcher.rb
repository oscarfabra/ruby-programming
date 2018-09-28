VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

def is_valid_email? email
  email =~ VALID_EMAIL_REGEX
end

p is_valid_email?("oscar@fabra.com") ? "Valid" : "Invalid"
p is_valid_email?("oscarfabra.com") ? "Valid" : "Invalid"
p is_valid_email?("oscar.j@fabra.com") ? "Valid" : "Invalid"
p is_valid_email?("oscar@fabra") ? "Valid" : "Invalid"
p is_valid_email?("oscar-j@fabra.net") ? "Valid" : "Invalid"