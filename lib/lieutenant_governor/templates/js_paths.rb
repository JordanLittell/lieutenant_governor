require 'erb'

module LieutenantGovernor
  module Templates
    class JsPaths

      TEMPLATE_FILE = './js_paths.erb'

      def initialize(routes)
        @routes = routes
      end

      def render
        ERB.new(File.read(filename)).result binding
      end
    end
  end
end
