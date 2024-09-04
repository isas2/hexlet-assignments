require_relative "lib/blog/version"

Gem::Specification.new do |spec|
  spec.name        = "blog"
  spec.version     = Blog::VERSION
  spec.authors     = ["Aleksandr Istomin"]
  spec.email       = ["is.as.001@gmail.com"]
  spec.homepage    = "https://hexlet.io"
  spec.summary     = "Hexlet homework Rails Blog engine"
  spec.description = "Hexlet homework Rails Blog engine"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://github.com/hexlet"

  spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", "7.1.3.2"
  spec.add_dependency "slim-rails"
  spec.add_dependency 'sqlite3', '~> 1.4'
end
