require "lieutenant_governor/version"
require 'lieutenant_governor/generators/js_route_helpers'

module LieutenantGovernor

  class Generator
    def self.generate
      Generators::JsRouteHelpers.generate_paths_file
    end
  end

end
