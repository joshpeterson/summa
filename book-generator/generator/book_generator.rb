require_relative '../../summa-parser/load'
require_relative 'summary_generator'
require 'pathname'

print "Loading summa data from file\n"
summa = load()
filename = Pathname.new(__dir__ + "/../../book/SUMMARY.md")
print "Writing summary to '#{filename.realpath}'\n"
summary = SummaryGenerator.new.write(summa)
File.open(filename.realpath, 'w') {|f| f.write(summary) }
