# frozen_string_literal: true

require_relative "lib/spy_system/version"

Gem::Specification.new do |spec|
  spec.name = "spy_system"
  spec.version = SpySystem::VERSION
  spec.authors = ["Federico Iachetti"]
  spec.email = ["iachetti.federico@gmail.com"]

  spec.summary = "Temporary filesystem"
  spec.description = "Temporary filesystem replacement for File, Dir and FileUtils"
  spec.homepage = "http://example.com"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.2"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://example.com"
  spec.metadata["changelog_uri"] = "http://example.com"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) {
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  }
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rspec-given", "~> 3.8.2"
  spec.add_dependency "zeitwerk", "~> 2.6.11"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata["rubygems_mfa_required"] = "true"
end
