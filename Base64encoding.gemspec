# frozen_string_literal: true

require_relative 'lib/Base64encoding/version'

# rubocop:disable Layout/LineEndStringConcatenationIndentation
Gem::Specification.new do |spec|
	spec.name = 'Base64encoding'
	spec.version = Base64encoding::VERSION
	spec.authors = ['DarkCard1nal']
	spec.email = ['']

	spec.summary = 'A gem for Base64 encoding and decoding.'
	spec.description = 'This gem has the encode_base64 method that encodes UTF-8 strings to' \
						'base64 (UTF-8) string, the decode_base64 method that decodes base64 string to UTF-8 string.'
	spec.homepage = 'https://github.com/DarkCard1nal/STP_Base64encoding.git'
	spec.required_ruby_version = '>= 3.3.5'

	spec.metadata['homepage_uri'] = spec.homepage
	spec.metadata['source_code_uri'] = spec.homepage
	spec.metadata['changelog_uri'] = spec.homepage

	# Specify which files should be added to the gem when it is released.
	# The `git ls-files -z` loads the files in the RubyGem that have been added into git.
	gemspec = File.basename(__FILE__)
	spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
		ls.readlines("\x0", chomp: true).reject do |f|
			(f == gemspec) ||
				f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
		end
	end
	spec.bindir = 'exe'
	spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
	spec.require_paths = ['lib']

	# Uncomment to register a new dependency of your gem
	# spec.add_dependency "example-gem", "~> 1.0"

	# For more information and examples about making a new gem, check out our
	# guide at: https://bundler.io/guides/creating_gem.html
	spec.metadata['rubygems_mfa_required'] = 'true'
end
# rubocop:enable Layout/LineEndStringConcatenationIndentation
