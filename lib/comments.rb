require 'comments/configuration'
require 'comments/version'
require 'comments/model'
require 'comments/engine'
require 'awesome_nested_set'
require 'will_paginate'
require 'will_paginate/active_record'

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
      @config
    end

    def configure(&block)
      config.instance_exec(&block)
    end
  end
end
