desc "Performs sanity check across the project"
task test: :environment do
  puts "== Performing security audit =="
  system "./bin/bundler-audit update"
  system "./bin/bundler-audit check"

  puts "== Running security check =="
  system "./bin/brakeman -z"

  puts "== Runnin Rubocop =="
  system "./bin/rubocop -R"

  puts "\n== Checking build of vue app (linting included) =="
  system "npm run build"

  puts "\n== Running FE tests =="
  system "npm run test"

  puts "\n== Running RSpec =="
  Rake::Task["spec"].invoke
end
