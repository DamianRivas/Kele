Gem::Specification.new do |s|
  s.name = 'kele'
  s.version = '0.0.1'
  s.date = '2018-12-03'
  s.summary = 'Kele API Client'
  s.description = 'A client for the Bloc API'
  s.authors = ['Damian Rivas']
  s.email = 'drivas1993@gmail.com'
  s.files = ['lib/kele.rb', 'lib/kele/roadmap.rb', 'lib/kele/messages.rb']
  s.require_paths = ['lib']
  s.homepage = 'http://rubygems.org/gems/kele'
  s.license = 'MIT'
  
  s.add_runtime_dependency 'httparty', '~> 0.13'
  s.add_runtime_dependency 'json', '~> 1.8.3'
  
  # s.add_development_dependency 'httparty', '~> 0.13'
  # s.add_development_dependency 'json', '~> 1.8.3'
  s.add_development_dependency "rspec"
  s.add_development_dependency "nyan-cat-formatter"
end