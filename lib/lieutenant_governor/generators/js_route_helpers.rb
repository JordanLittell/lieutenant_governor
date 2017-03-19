require 'thor/group'
module LieutenantGovernor

  module Generators
    class JsRouteHelpers < Thor::Group
      include Thor::Actions
      # Use the extractor to get the hash
      # assume function exists to translate hash to javascript text
      # using Thor, open up a file, and then write the javascript text to
      # the file
    end
  end
end
