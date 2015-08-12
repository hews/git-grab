require "stringio"
require "colorize"

# drop these so that FileUtils doesn't print out...
STD_OUT = $stdout
STD_ERR = $stderr
$stdout = StringIO.new
$stderr = StringIO.new

require "fileutils"
include FileUtils

task :destroy do
  STD_OUT.puts
  STD_OUT.puts "Emptying /build folder...".blue
  rm_rf "build"
  mkdir "build"
  STD_OUT.puts "  Complete.".green
end

task :lint do
  begin
    mkdir "tmp"
    system "./bin/build tmp"
    system "./bin/lint tmp"
    raise unless $?.success?
  rescue
    STD_ERR.puts "Lint found errors, can not continue with build.".red
    STD_ERR.puts
    exit 1
  ensure
    rm_rf "tmp"
  end
end

task :build => [:destroy, :lint] do
  system "./bin/build"
end

task :default => :build
