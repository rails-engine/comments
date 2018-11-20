# Model from comments gem
class Comment < ActiveRecord::Base
  include Comments::Model
end
