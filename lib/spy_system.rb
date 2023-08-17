# frozen_string_literal: true

require_relative "spy_system/version"

require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.setup

module SpySystem
  class Error < StandardError; end
end
