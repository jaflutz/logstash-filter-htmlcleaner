Gem::Specification.new do |s|
  s.name = 'logstash-filter-htmlcleaner'
  s.version = '0.1.0'
  s.licenses = ['Apache License (2.0)']
  s.summary = "Logstash filter to remove html entities"
  s.description = "Logstash filter to remove html entities"
  s.authors = ["João Adolfo Lutz"]
  s.email = 'jaflutz@gmail.com'
  s.homepage = ""
  s.require_paths = ["lib"]

  # Files
  s.files = Dir['lib/**/*','spec/**/*','vendor/**/*','*.gemspec','*.md','CONTRIBUTORS','Gemfile','LICENSE','NOTICE.TXT']
  # Tests
    s.test_files = s.files.grep(%r{^(test|spec|features)/})
    
    # Special flag to let us know this is actually a logstash plugin
   s.metadata = { "logstash_plugin" => "true", "logstash_group" => "filter" }

   # Gem dependencies
   s.add_runtime_dependency "logstash-core-plugin-api", ">= 1.60", "<= 2.99"
   s.add_runtime_dependency "nokogiri", "1.8.0"
   s.add_development_dependency 'logstash-devutils', "1.3.3"
end
