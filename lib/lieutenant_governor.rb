require "lieutenant_governor/version"
require "lieutenant_governor/route_extracter"

module LieutenantGovernor
  class Resolver
    def self.resolve
      routes = Rails.application.routes.routes
      extracter = LieutenantGovernor::Routing::Extractor.new(routes)
      extracter.route_table
    end
  end
end
