# frozen_string_literal: true

require "spy_system"

RSpec.describe "directories" do
  subject(:filesystem) { SpySystem::Fake.new }
  let(:dir) { filesystem.dir }

  let(:home) { Dir.home }
  let(:pwd) { `pwd`.chomp }

  context "temporary directories" do
    describe "naming directories" do
      it "returns the path as a string" do
        directory = dir.mktmpdir

        expect(directory).to be_a(String)
        expect(directory).to match(%q(\A/tmp/d\d{8}-\d{6}-.+\z))
      end

      it "yields the path as a string" do
        dir.mktmpdir do |directory|
          expect(directory).to be_a(String)
          expect(directory).to match(%q(\A/tmp/d\d{8}-\d{6}-.+\z))
        end
      end

      it "does something" do
        directory = dir.mktmpdir("name-")

        expect(directory).to be_a(String)
        expect(directory).to match(%q(\A/tmp/name-\d{8}-\d{6}-.+\z))
      end

      it "does something" do
        dir.mktmpdir("name-") do |directory|
          expect(directory).to be_a(String)
          expect(directory).to match(%q(\A/tmp/name-\d{8}-\d{6}-.+\z))
        end
      end
    end
  end

  describe "pwd" do
    it "defaults to the current directory" do
      dir.mktmpdir do
        expect(dir.pwd).to eql(pwd)
      end
    end
  end

  describe "changing directories" do
    it "can change directories" do
      dir.mktmpdir do |directory|
        internal_pwd = ""

        dir.chdir(directory) do
          internal_pwd = dir.pwd
        end

        expect(internal_pwd).to eql(directory)
        expect(dir.pwd).to eql(pwd)
      end
    end

    it "can change directories" do
      dir.mktmpdir do |directory|
        dir.chdir(directory)

        expect(dir.pwd).to eql(directory)
      end
    end

    it "defaults to the home directory" do
      dir.mktmpdir do |_directory|
        dir.chdir

        expect(dir.pwd).to eql(home)
      end
    end
  end

  describe "creating directories" do
    it "does something" do
      dir.mktmpdir do |directory|
        new_directory_name = "#{directory}/new"
        dir.chdir(directory) do
          dir.mkdir(new_directory_name)

          expect(dir.exist?(new_directory_name)).to eql(true)
        end
      end
    end
  end
end
