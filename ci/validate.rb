require "yaml"


add_ids = {} #accumulate ids in a hash
Dir.glob('**/rule-*.yml').each do |file|  # checking through the directories for the yaml files
    get_content = File.read(file) 
    yaml_dict = YAML.load(get_content)

    yaml_dict['rules'].each do |key,value|  #Iterating through components in a rule
        if key == "id"  #Taking out ids and storing them as values of add_ids hash
            if add_ids.include?(value)
                add_ids[value]+=1
            else
                add_ids[value]=1
            end
        end
    end
end

add_ids.each do |key,value|  # Checking add_ids hash for occurences of each id
    if value > 1
        repetition = repetition + 1 #If any id repeats
    end
end

exit(-1) if repetition > 0 #Fail if ruleid is repeated

exit(0)


