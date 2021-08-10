#!/usr/bin/env ruby
# This script consolidates all yaml files to a single rule files

require 'yaml'
require_relative './autoformat.rb'

Dir.mkdir("rule-sets") unless Dir.exists?("rule-sets")

Dir.glob('mappings/*.yml').each do |mappings|
  prefix = File.basename(mappings, ".yml")
  dict = YAML.safe_load(File.read(mappings))

  rulez = { }
  counter = { }

  dict[prefix].each do |mapping|
    id = mapping["id"]
    mapping["rules"].each do |rule|
      rulefiledict = YAML.safe_load(File.read("#{rule}.yml"))
      rulefromfile = rulefiledict['rules'].first
      remapped_prefix = "#{prefix}.#{id}"
      counter[remapped_prefix] += 1 if counter.key?(remapped_prefix)
      counter[remapped_prefix] = 1 unless counter.key?(remapped_prefix)
      rulefromfile['id'] = "#{prefix}.#{id}-#{counter[remapped_prefix]}"
      rulez[rulefromfile['id']] = rulefromfile
    end
  end

  outdict = { 'rules' => [] }
  rulez.each do |ruleid, rule|
    ruleprefix = ruleid.gsub(/-[0-9]+$/, '')
    id = counter[ruleprefix] == 1 ? ruleprefix : ruleid
    rule['id'] = id
    outdict['rules'] << rule
  end

  formatted = AutoFormat.reformat_yaml('', outdict)
  puts("writing #{prefix}.yml")
  File.open("rule-sets/#{prefix}.yml", 'w') { |file| file.write(formatted) }
end
