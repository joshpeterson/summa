require 'rubocop/rake_task'

task :default do
  rubocop = RuboCop::RakeTask.new
  rubocop.run_main_task(true)
end
