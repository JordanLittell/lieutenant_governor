require_relative "lieutenant_governor/version"
require_relative 'lieutenant_governor/generators/js_route_helpers'

module LieutenantGovernor

  class Generator
    def self.generate(path)
      Generators::JsRouteHelpers.generate_paths_file(path)
    end
  end

end
