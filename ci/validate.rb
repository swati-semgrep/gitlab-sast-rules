require "yaml"
require "psych"

repetition = 0
all_ids = {} #accumulate ids in a hash
Dir.glob('**/rule-*.yml').each do |file|  # checking through the directories for the yaml(rule) files
    get_content = File.read(file) 
    yaml_dict = YAML.load(get_content)

    inside_file = Psych.parse_stream(Psych.dump(yaml_dict))
    
    inside_file.grep(Psych::Nodes::Mapping).each do |node|
        node.children.each_slice(2) do |k, v|
          case k.value
          when 'id'    #Taking ids of each file and adding them it all_ids hash
                if all_ids.include?(v.value) # Structure is -> {"the_id"=>number of occurence}
                    all_ids[v.value]=add_ids[v.value]+1
                else
                    all_ids[v.value] = 1
                end
          end
        end
    end
end

all_ids.each do |key,value|  # Checking all_ids hash for occurences of each id
    if value > 1                    # Check if any id occurs more than once.
        repetition = repetition + 1 #If any id repeats
    end
end

exit(-1) if repetition > 0 #Fail if ruleid is repeated(i.e., presence of duplicates)

exit(0)
