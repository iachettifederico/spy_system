# frozen_string_literal: true

require "spy_system"

RSpec.describe "directories" do
  # let(:filesystem) { SpySystem::Real.new }
  let(:filesystem) { SpySystem::Fake.new }
  let(:dir) { filesystem.dir }

  context "temporary directories" do
    describe "naming directories" do
      it "returns the path as a string" do
        directory = dir.mktmpdir

        expect(directory).to be_a(String)
        expect(directory).to match(%q(\A/tmp/d\d{8}-\d{6}-.{6}\z))
      end

      it "yields the path as a string" do
        dir.mktmpdir do |directory|
          expect(directory).to be_a(String)
          expect(directory).to match(%q(\A/tmp/d\d{8}-\d{6}-.{6}\z))
        end
      end

      it "does something" do
        directory = dir.mktmpdir("name-")

        expect(directory).to be_a(String)
        expect(directory).to match(%q(\A/tmp/name-\d{8}-\d{6}-.{6}\z))
      end

      it "does something" do
        dir.mktmpdir("name-") do |directory|
          expect(directory).to be_a(String)
          expect(directory).to match(%q(\A/tmp/name-\d{8}-\d{6}-.{6}\z))
        end
      end
    end
  end

  describe "pwd" do
    it "xxxx" do
      dir.mktmpdir do |_directory|
        expect(dir.pwd).to eql(`pwd`.chomp)
      end
    end
  end

  describe "changing directories" do
    it "xxxx" do
      dir.mktmpdir do |directory|
        dir.chdir(directory)
        expect(dir.pwd).to eql(directory)
      end
    end

    it "xxxx" do
      dir.mktmpdir do |directory|
        dir.chdir
        expect(dir.pwd).to eql(ENV["HOME"])
      end
    end

  end
end
