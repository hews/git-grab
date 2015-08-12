require "stringio"
require "colorize"

# drop these so that FileUtils doesn't print out...
STD_OUT = $stdout
STD_ERR = $stderr
$stdout = StringIO.new
$stderr = StringIO.new

require "fileutils"
include FileUtils

task :destroy_build do
  STD_OUT.puts
  STD_OUT.puts "Emptying /build folder...".blue
  rm_rf "build"
  mkdir "build"
  STD_OUT.puts "  Complete.".green
end

task :make_tmp => [:destroy_tmp] do
  mkdir "tmp"
end

task :lint do
  begin
    system "./bin/build tmp"
    system "./bin/lint tmp"
    raise unless $?.success?
  rescue
    STD_ERR.puts "Lint found errors, can not continue with build.".red
    STD_ERR.puts
    exit 1
  end
end

task :test do
  begin
    system "./bin/test"
    raise unless $?.exitstatus == 0
  rescue
    STD_ERR.puts "Test had failures, can not continue with build.".red
    STD_ERR.puts
    exit 1
  end
end

task :destroy_tmp do
  rm_rf "tmp"
end

task :build => [:destroy_build, :make_tmp, :lint, :test, :destroy_tmp] do
  system "./bin/build build"
end

task :default => :build
