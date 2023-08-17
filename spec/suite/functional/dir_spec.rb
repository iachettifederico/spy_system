# frozen_string_literal: true

require "spy_system"

RSpec.describe "directories" do
  let(:filesystem) { SpySystem::Real.new }
  let(:dir) { filesystem.dir }

  it "returns the path as a string" do
    directory = dir.mktmpdir

    expect(directory).to be_a(String)
    expect(directory).to match(%q{\A/tmp/d\d{8}-\d{6}-.{6}\z})
  end

  it "yields the path as a string" do
    dir.mktmpdir do |directory|
      expect(directory).to be_a(String)
      expect(directory).to match(%q{\A/tmp/d\d{8}-\d{6}-.{6}\z})
    end
  end

end
