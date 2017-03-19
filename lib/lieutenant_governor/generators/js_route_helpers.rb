require 'thor/group'
require 'lieutenant_governor/routing/extractor'
require 'lieutenant_governor/templates/js_paths'
require 'lieutenant_governor/templates/js_paths_template_str'

module LieutenantGovernor

  module Generators
    class JsRouteHelpers < Thor::Group
      extend Thor::Actions
      # Use the extractor to get the hash
      # assume function exists to translate hash to javascript text
      # using Thor, open up a file, and then write the javascript text to
      # the file

      def self.generate_paths_file

        routes = Rails.application.routes.routes
        route_table = LieutenantGovernor::Routing::Extractor.extract(routes)
        template = LieutenantGovernor::Templates::JsPaths.new(route_table)
        # create_file '/client/paths.js', template.render
        File.open('./client/app/libs/paths.js', 'w') do |f|
          f.puts template.render
        end
      end
    end
  end
end
