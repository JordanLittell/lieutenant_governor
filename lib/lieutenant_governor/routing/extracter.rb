require 'action_dispatch/routing'

module LieutenantGovernor
  # singleton holding config for gem
  module Routing

    class Extractor

      attr_reader :route_table

      # Takes applications routes and converts to hash
      # @param [ActionDispatch::Routing::RouteSet]
      # @return [Hash] table mapping names to paths
      def self.extract(routes)
        table = {}
        # possible to get blank strings as keys here
        routes.reduce(table) { |memo, obj| table[get_name(obj)] = get_path(obj) }
        table
      end

      # @param [ActionDispatch::Routing::Journey]
      def get_name(obj)
        wrap(obj).name.camelcase
      end

      # @param [ActionDispatch::Routing::Journey]
      def get_path(obj)
        wrap(obj).path.split('(.:format)')[0]
      end

      # @param [ActionDispatch::Routing::Journey]
      def wrap(obj)
        ActionDispatch::Routing::RouteWrapper.new(obj)
      end
    end
  end
end
