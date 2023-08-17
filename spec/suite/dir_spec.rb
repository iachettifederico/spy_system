# frozen_string_literal: true

require "spy_system"

RSpec.describe "directories" do
  let(:filesystem) { SpySystem::Real.new }

  it "does something" do
    filesystem
  end
end

