module Comments
  class ApplicationController < ::ApplicationController
    helper_method :current_user

    alias_method :origin_current_user, Comments.config.current_user_method.to_sym
    alias_method :origin_authenticate_user!, Comments.config.authenticate_user_method.to_sym

    before_action :authenticate_user!

    def current_user
      origin_current_user
    end

    def authenticate_user!
      origin_authenticate_user!
    end
  end
end
