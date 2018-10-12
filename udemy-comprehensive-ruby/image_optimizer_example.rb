# Before using image_optimizer:
# brew install optipng jpegoptim gifsicle pngquant
# ...
# gem install 'image_optimizer'

require 'image_optimizer'

ImageOptimizer.new('okc_skyline.png', quality: 25).optimize

