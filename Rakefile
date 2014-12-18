require "bundler/gem_tasks"

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new
task :default => :spec
=begin
desc "Ejecutar las espectativas de la clase Exam"
task :spec do
  sh "rspec spec/exam_spec.rb"
end

desc "Ejecutar la espectativa en formato de documentacion"
task :doc do
  sh "rspec spec/exam_spec.rb --format documentation"
end

desc "Ejecutar la espectativa en formato html"
task :html do
  sh "rspec spec/exam_spec.rb --format html --out exam.html"
end
=end

desc "Ejecutar las espectativas de la clase List"
task :spec do
  sh "rspec spec/list_spec.rb"
end

desc "Ejecutar la espectativa en formato de documentacion"
task :doc do
  sh "rspec spec/list_spec.rb --format documentation"
end

desc "Ejecutar la espectativa en formato html"
task :html do
  sh "rspec spec/list_spec.rb --format html --out list.html"
end
