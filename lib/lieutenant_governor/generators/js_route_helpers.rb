require 'thor/group'
require_relative '../routing/extractor'
require_relative '../templates/js_paths.rb'
require_relative '../templates/js_paths_template_str'

module LieutenantGovernor

  module Generators

    class JsRouteHelpers < Thor::Group
      extend Thor::Actions
      # Use the extractor to get the hash
      # assume function exists to translate hash to javascript text
      # using Thor, open up a file, and then write the javascript text to
      # the file

      def self.generate_paths_file(path)
        raise TypeError.new('Path must be String.') unless path.class == String
        routes = Rails.application.routes.routes
        route_table = LieutenantGovernor::Routing::Extractor.extract(routes)
        template = LieutenantGovernor::Templates::JsPaths.new(route_table)
        # create_file '/client/paths.js', template.render
        File.open(path, 'w') do |f|
          f.puts template.render
        end
      end
    end
  end
end
