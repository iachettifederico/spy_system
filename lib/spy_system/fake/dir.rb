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

      def pwd
        current_directory
      end

      def chdir(path=ENV["HOME"], &block)
        if block_given?
          old_directory = @current_directory
          @current_directory = path
          block.call
          @current_directory = old_directory
        else
          @current_directory = path
        end
      end

      private

      attr_reader :filesystem
      attr_reader :current_directory

      def initialize(filesystem)
        @filesystem = filesystem
        @current_directory = `pwd`.chomp
      end

      def generate_directory_name(prefix_suffix)
        "/tmp/#{prefix_suffix}11111111-111111-aaa111"
      end
    end
  end
end
