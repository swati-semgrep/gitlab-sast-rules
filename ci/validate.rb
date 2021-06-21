require 'yaml'

repeat = 0
#Take out all ids from the ruleset and store in all_ruleids array
all_ruleids = Dir.glob('**/rule-*.yml').map {|file| YAML.load(File.read(file))['rules'].first['id'] }
# filter duplicate rule ids
duplicates = all_ruleids.tally.filter{ |ruleid, count| repeat > 1 }.map{ |ruleid,count| ruleid}

#Showing duplicates to user.
if duplicates.any?
 puts("duplicate ids: #{duplicates.join(",")}")
 exit(1) 
end

exit (0)
