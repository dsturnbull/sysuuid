require 'vendor/gems/environment'

require 'rake'
require 'spec'
require 'spec/rake/spectask'

task :default => [:clean, :make, :spec]

task :make do
  Dir.chdir 'ext' do
    puts `ruby extconf.rb`
    puts `make`
  end
end

Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_opts = %w(-fs -c)
  t.spec_files = FileList['spec/*_spec.rb']
end

task :clean do
  `rm -r ext/*.o ext/*.so ext/*.bundle ext/conftest.dSYM 2>/dev/null`
end

require 'jeweler'
Jeweler::Tasks.new do |s|
  s.name = 'sysuuid'
  s.summary = 'uses uuid.h for fast uuid generation'
  s.email = 'dsturnbull@me.com'
  s.homepage = 'http://github.com/dsturnbull/sysuuid'
  s.description =<<-eod
      sysuuid # => BBC4937C-344F-47C5-AA36-E19CC070DBCC
  eod
  s.executables = []
  s.authors = ['David Turnbull']
  s.files = ['Rakefile', 'ext/sysuuid.c', 'ext/extconf.rb', 'ext/Makefile']
end
