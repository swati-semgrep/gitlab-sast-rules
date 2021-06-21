require 'yaml'

repeat = 0
all_ruleids = Dir.glob('**/rule-*.yml').map {|file| YAML.load(File.read(file))['rules'].first['id'] }
# filter duplicate rule ids
count_occurence = all_ruleids.tally
duplicates = count_occurence.filter{ |ruleid, count| repeat > 1 }.map{ |ruleid,count| ruleid}

puts all_ruleids
puts duplicates
if duplicates.any?
 puts("duplicate ids: #{duplicates.join(",")}")
 exit(1)
end

exit (0)
