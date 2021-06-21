require "yaml"
require "psych"

array= []
repetition = 0
add_ids = {} #accumulate ids in a hash
Dir.glob('**/rule-*.yml').each do |file|  # checking through the directories for the yaml files
    get_content = File.read(file) 
    yaml_dict = YAML.load(get_content)

    ast = Psych.parse_stream(Psych.dump(yaml_dict))
    
    ast.grep(Psych::Nodes::Mapping).each do |node|
        node.children.each_slice(2) do |k, v|
          case k.value
          when 'id'
                if add_ids.include?(v.value)
                    add_ids[v.value]=add_ids[v.value]+1
                else
                    add_ids[v.value] = 1
                end
          end
        end
    end
end

puts add_ids
add_ids.each do |key,value|  # Checking add_ids hash for occurences of each id
    if value > 1
        repetition = repetition + 1 #If any id repeats
    end
end
puts repetition
exit(-1) if repetition > 0 #Fail if ruleid is repeated

exit(0)
