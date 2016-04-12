require 'rails/generators'
module Comments
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Create Comments's base files"
      source_root File.expand_path("../../../../", __FILE__)

      def add_initializer
        path = "#{Rails.root}/config/initializers/comments.rb"
        if File.exists?(path)
          puts "Skipping config/initializers/comments.rb creation, as file already exists!"
        else
          puts "Adding Comments initializer (config/initializers/comments.rb)..."
          template "config/initializers/comments.rb", path
        end
      end

      def add_models
        path = "#{Rails.root}/app/models/comment.rb"
        if File.exists?(path)
          puts "Skipping app/models/comment.rb creation, as file already exists!"
        else
          puts "Adding Comments model (app/models/comment.rb)..."
          template "app/models/comment.rb", path
        end
      end

      def add_migrations
        exec("rails comments:install:migrations")
      end
    end
  end
end
