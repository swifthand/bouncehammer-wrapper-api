require 'rake'
require 'rake/testtask'

Rake::TestTask.new do |task|
  task.libs << %w(test)
  task.pattern = 'test/**/*tests.rb'
  # task.test_files = FileList['test/**/test*.rb']
end

task :default => :test
