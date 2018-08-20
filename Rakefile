require 'rake/testtask'

task default: %w[test]

Rake::TestTask.new do |task|
  task.pattern = 'test/**/*_test.rb'
  task.warning = false
end

task :run do
  ruby './app.rb'
end
