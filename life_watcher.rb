system("clear")

def run(cmd)
  system("clear")
  system cmd
end

def run_test_file(file)
  system("clear")
  result = run(%Q(rspec #{file}))
  puts result
end

def run_all_tests
  system("clear")
  result = run 'rspec spec'
  puts result
end

def run_matching_test_file(file)
  test_file = file.gsub(/^lib/, "spec")
  test_file = file.gsub(/$.rb/, "_spec.rb")
  puts test_file
  run_test_file test_file
end

#watch('spec/spec_helper\.rb') { run_all_tests }
#watch('spec/.*_spec\.rb') { |m| run_test_file(m[0]) }
watch('lib/.*\.rb') { |m| run('ruby life.rb')}
watch('life\.rb') { |m| run('ruby life.rb') }

