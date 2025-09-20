# frozen_string_literal: true

require_relative 'lib/hexlet_code/version'

Gem::Specification.new do |spec|
  spec.name = 'hexlet_code'
  spec.version = HexletCode::VERSION
  spec.authors = ['Egor']
  spec.email = ['hyinm2012@yandex.ru']

  spec.summary = 'Form Generator is a DSL that makes it easy to generate forms. This library takes care of tasks that would normally require writing a lot of boilerplate code, such as error handling.'
  spec.description = 'Creates a form based on some object.'
  spec.homepage = 'https://github.com/Egor1007-del/rails-project-63'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.1.0'

  spec.metadata['homepage_uri'] = 'https://github.com/Egor1007-del/rails-project-63'
  spec.metadata['source_code_uri'] = 'https://github.com/Egor1007-del/rails-project-63'
  spec.metadata['changelog_uri'] = 'https://github.com/Egor1007-del/rails-project-63/blob/main/CHANGELOG.md'

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

  spec.add_dependency 'activesupport', '>= 7.0'
end
