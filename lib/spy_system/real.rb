require "tmpdir"

module SpySystem
  class Real
    def dir
      ::Dir
    end
  end
end
