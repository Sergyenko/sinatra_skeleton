require 'rubygems'
require 'bundler'

Bundler.setup

require 'rake'
require 'spec/rake/spectask'

THIN_OPTIONS = { :daemonize   => true,
                 :pid         => 'pid/thin.pid', 
                 :log         => 'log/thin.log',
                 :chdir       => Dir.getwd,
                 :address     => '0.0.0.0', 
                 :wait        => 30,
                 :max_conns   => 1024,
                 :timeout     => 30,
                 :rackup      => 'config.ru',
                 :require     => [ ],
                 :port        => 3001,
                 :environment => 'development',
                 :max_persistent_conns => 512 }

task :default => :spec

desc "Run all examples"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_opts = ["--colour --format=nested"]
  t.spec_files = FileList['spec/**/*.rb']
end

namespace :thin do

  task :start do
    puts "Thin starting at #{THIN_OPTIONS[:address]}:#{THIN_OPTIONS[:port]}, logging to #{THIN_OPTIONS[:log]}"
    FileUtils.mkdir_p('log')
    FileUtils.mkdir_p('pid')
    require 'thin'
    controller = Thin::Controllers::Controller.new(THIN_OPTIONS)
    controller.start
  end

  task :stop do
    require 'thin'
    controller = Thin::Controllers::Controller.new(THIN_OPTIONS)
    controller.stop
  end

end

