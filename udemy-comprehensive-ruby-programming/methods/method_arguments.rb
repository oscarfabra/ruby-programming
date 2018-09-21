# def full_name(first_name, last_name)
#   first_name + " " + last_name
# end

# puts full_name "Oscar", "Fabra"

# Named arguments, order of arguments doesn't matter
# def print_address city:, state:, zip:
#   puts city
#   puts state
#   puts zip
# end

# print_address city: "Montelíbano", state: "Córdoba", zip: 234001

# def sms_generator api_key:, num:, msg:, locale:
#   # magic sms code...
# end

# sms_generator num: 1234567, api_key: '987654how', msg: 'hey there', locale: 'US'

# Default arguments
def stream_movie title:, lang: "ENG"
  puts title
  puts lang
end

stream_movie title: "Matrix", lang: "ES"