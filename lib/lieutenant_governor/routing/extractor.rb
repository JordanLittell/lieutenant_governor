# require 'action_dispatch/routing'

module LieutenantGovernor
  # singleton holding config for gem
  module Routing

    class Extractor

      attr_reader :routes

      # Takes applications routes and converts to hash
      # @param [ActionDispatch::Routing::RouteSet]
      # @return [Hash] table mapping names to paths
      def self.extract(routes)
        instance = new(routes)
        instance.extract
      end

      def initialize(routes)
        @routes = routes
      end

      def extract
        table = {}
        # possible to get blank strings as keys here
        routes.reduce(table) do |memo, obj|
          name = get_name(obj)
          path = get_path(obj)
          table[name] = path if name.present? && path.present?
        end

        table
      end

      private

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
