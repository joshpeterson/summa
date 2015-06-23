task :default do
  Dir.chdir("summa-parser") do
    print("Running rake in summa-parser directory.\n")
    ruby("-S", "rake")
  end
end
