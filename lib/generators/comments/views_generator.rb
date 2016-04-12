require 'rails/generators'

module Comments
  module Generators
    class ViewsGenerator < Rails::Generators::Base #:nodoc:
      source_root File.expand_path("../../../../app/views", __FILE__)
      desc "Used to copy Comments's views to your application's controllers."

      def copy_views
        %w(comments).each do |fname|
          path = "#{Rails.root}/app/views/comments"
          if File.exists?(path)
            puts "Skipping app/views/comments creation, as file already exists!"
          else
            puts "Adding views..."
            directory "comments/", path
          end
        end
      end
    end
  end
end
