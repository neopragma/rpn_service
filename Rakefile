require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

desc "Run rpn_service tests"
task :service do      
  exec "rspec spec/lib/rpn_service"
end

task :default => :spec