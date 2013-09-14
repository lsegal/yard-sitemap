Gem::Specification.new do |spec|
  spec.name          = "yard-sitemap"
  spec.version       = "1.0.0"
  spec.authors       = ["Loren Segal"]
  spec.email         = ["lsegal@soen.ca"]
  spec.description   = "YARD plugin to build a sitemap.xml for generated HTML documentation."
  spec.homepage      = "http://github.com/lsegal/yard-sitemap"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
end
