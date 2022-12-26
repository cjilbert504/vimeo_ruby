# frozen_string_literal: true

require_relative "lib/vimeo_ruby/version"

Gem::Specification.new do |spec|
  spec.name = "vimeo_ruby"
  spec.version = VimeoRuby::VERSION
  spec.authors = ["Collin Jilbert"]
  spec.email = ["cjilbert504@gmail.com"]

  spec.summary = "A Ruby gem for interacting with the Vimeo API"
  spec.description = "A Ruby gem for interacting with the Vimeo API"
  spec.homepage = "https://github.com/cjilbert504/vimeo_ruby"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/cjilbert504/vimeo_ruby"
  spec.metadata["changelog_uri"] = "https://github.com/cjilbert504/vimeo_ruby/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  spec.add_development_dependency "webmock", "~> 3.18", ">= 3.18.1"
  spec.add_development_dependency "vcr", "~> 6.1"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
