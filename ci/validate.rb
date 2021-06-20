require "yaml"


add_ids = {} #accumulate ids in a hash
repetition = [] # store the repetitive rule_ids, Maybe used
Dir.glob('**/rule-*.yml').each do |file|  # checking through the directories for the yaml files
    get_content = File.read(file) 
    yaml_dict = YAML.load(get_content)

    yaml_dict['rules'].each do |key,value|  #Iterating to count rules -> occurence
        if key == "id"
            if add_ids.include?(value)
                add_ids[value]+=1
            else
                add_ids[value]=1
            end
        end
    end
end

add_ids.each do |key,value|  # Checking if repetition is there
    if value > 1
        repetition.append(value)
    end
end

puts repetition
exit(-1) if repetition.count > 0 #Fail if rule is repeated

exit(0)


