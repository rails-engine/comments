require 'rails/generators'

module Comments
  module Generators
    class ControllsGenerator < Rails::Generators::Base #:nodoc:
      source_root File.expand_path("../../../../app/controllers", __FILE__)
      desc "Used to copy Comments's controllers to your application's controllers."

      def copy_controllers
        %w(comments).each do |fname|
          path = "#{Rails.root}/app/controllers/comments/#{fname}_controller.rb"
          if File.exists?(path)
            puts "Skipping comments/#{fname}_controller.rb creation, as file already exists!"
          else
            puts "Adding model (comments/#{fname}_controller.rb)..."
            template "comments/#{fname}_controller.rb", path
          end
        end
      end
    end
  end
end
