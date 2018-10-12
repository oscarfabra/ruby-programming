# user = {
#   name: "Kristine",
#   favorites: {
#     food: "Pizza",
#     movies: "Fiddler on the roof"
#   }
# }

# user.dig(:name)
# user.dig(:favorites, :movies)

require 'yaml'

config = YAML.load_file('config.yml')

# config.inspect
# config.class  # A Hash object
p config.dig('secret_key')
p config.dig('production', 'aws_key')
p config.dig('development', 'aws_key')