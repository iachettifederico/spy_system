# frozen_string_literal: true

module SpySystem
  class Fake
    attr_reader :filesystem

    def initialize
      @filesystem = {}
    end

    def dir
      ::SpySystem::Fake::Dir[filesystem]
    end
  end
end
