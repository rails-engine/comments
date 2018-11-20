require 'comments/configuration'
require 'comments/version'
require 'comments/model'
require 'comments/view_helpers'
require 'comments/engine'
require 'awesome_nested_set'

module Comments
  class << self
    def config
      return @config if defined?(@config)
      @config = Configuration.new
      @config.user_class = 'User'
      @config.user_name_method = 'name'
      @config.user_avatar_url_method = nil
      @config.user_profile_url_method = 'profile_url'
      @config.authenticate_user_method = 'authenticate_user!'
      @config.current_user_method = 'current_user'
      @config.max_reply_depth = 10
      @config
    end

    def configure(&block)
      config.instance_exec(&block)
    end
  end
end

ActionController::Base.send(:helper, Comments::ViewHelpers)
