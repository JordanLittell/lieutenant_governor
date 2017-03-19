require 'thor/group'
module LieutenantGovernor

  module Generators
    class JsRouteHelpers < Thor::Group
      include Thor::Actions
      # Use the extractor to get the hash
      # assume function exists to translate hash to javascript text
      # using Thor, open up a file, and then write the javascript text to
      # the file

      def self.generate_paths_file
        routes = Rails.application.routes.routes
        route_table = LieutenantGovernor::Routing::Extractor.extract(routes)
        # js_text = call some method
        File.open('/client/paths.js', 'w') {|file| file.truncate(0) }
        append_to_file '/client/paths.js', js_text
      end
    end
  end
end
