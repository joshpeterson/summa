task :default do
  Dir.chdir('book-generator') do
    print("Running rake in book-generator directory.\n")
    ruby('-S', 'rake')
  end
end
