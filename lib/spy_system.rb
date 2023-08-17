# frozen_string_literal: true

require_relative "spy_system/version"

require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.setup

require "awesome_print"
AwesomePrint.defaults = {
  indent: 2,
  index:  false,
}

module SpySystem
  class Error < StandardError; end
end
