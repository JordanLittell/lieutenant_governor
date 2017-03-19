require 'erb'

module LieutenantGovernor
  module Templates
    class JsPaths

      attr_reader :routes

      def initialize(routes)
        @routes = routes
      end

      def render
        b = binding
        ERB.new(LieutenantGovernor::Templates::JS_PATHS_TEMPLATE_STR).result b
      end
    end
  end
end
