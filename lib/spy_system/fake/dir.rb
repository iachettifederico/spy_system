# frozen_string_literal: true

module SpySystem
  class Fake
    class Dir
      def self.[](filesystem)
        new(filesystem: filesystem)
      end

      def mktmpdir(prefix_suffix="d", &)
        generate_directory_name(prefix_suffix).tap { |directory|
          yield directory if block_given?
        }
      end
      
      private

      attr_reader :filesystem

      def initialize(filesystem)
        @filesystem = filesystem
      end

      def generate_directory_name(prefix_suffix)
        "/tmp/#{prefix_suffix}11111111-111111-aaa111"
      end
    end
  end
end
