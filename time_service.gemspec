require_relative 'lib/time_service/version'

Gem::Specification.new do |spec|
  spec.name          = "time_service"
  spec.version       = TimeService::VERSION
  spec.authors       = ["Brian Witte"]
  spec.email         = ["buoy5000@gmail.com"]

  spec.summary       = %q{The best time_service gem.}
  spec.description   = %q{Do you like time?}
  spec.homepage      = "https://github.com/buoy49/time_service"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/buoy49/time_service"
  spec.metadata["changelog_uri"] = "https://github.com/buoy49/time_service/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
