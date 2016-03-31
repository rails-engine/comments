# Model from comments gem
class Comment < ActiveRecord::Base
  include Comments::Model

  self.per_page = 50
end
