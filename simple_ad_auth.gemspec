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
  ],

  s.add_dependency('net-ldap')

  s.add_development_dependency('rpsec', "~> 2.8.0")
end