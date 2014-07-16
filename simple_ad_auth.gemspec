Gem::Specification.new do |s|
  s.name = "simple_ad_auth"
  s.version = "1.0.0"
  s.authors = ["Nat Williams"]
  s.email = "nat.williams@gmail.com"
  s.summary = "AD authentication that doesn't confuse me"
  s.files = Dir['lib/**/*.rb', 'spec/**/*.rb'] + [
    'Rakefile',
    'README.md',
    '.rspec',
    'Gemfile',
    'LICENSE',
    'simple_ad_auth.gemspec',
  ]
  s.require_paths = ["lib"]

  s.add_dependency('net-ldap', "~> 0.3.1")

  s.add_development_dependency('rake')
  s.add_development_dependency('rspec', "~> 2.14.0")
  s.add_development_dependency('yard', "~> 0.8")
end
