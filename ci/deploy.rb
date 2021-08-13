#!/usr/bin/env ruby
# This script consolidates all yaml files to a single rule files

require 'yaml'
require_relative './autoformat.rb'

Dir.mkdir("rule-sets") unless Dir.exists?("rule-sets")

Dir.glob('mappings/*.yml').each do |mappings|
  prefix = File.basename(mappings, ".yml")
  dict = YAML.safe_load(File.read(mappings))

  rulez = {}
  id2rules = {}
  rule2ids = {}
  ruleids = {}
  rulefiles = []

  dict[prefix].each do |mapping|
    id = mapping['id']
    ruleids[id] = ruleids.keys.size unless ruleids.key?(id)
    id2rules[id] = [] unless id2rules.key?(id)
    mapping['rules'].each do |rule|
      rule2ids[rule] = [] unless rule2ids.key?(rule)
      rule2ids[rule] << id
      id2rules[id] << rule
      rulefiles << rule
    end
  end
  
  rulefiles.sort!.uniq!

  rulefiles.each do |rfil|
    rulefiledict = YAML.safe_load(File.read("#{rfil}.yml"))
    rulefromfile = rulefiledict['rules'].first
    ids = rule2ids[rfil]
    # generate a unique rule hash that makes it possible to map results
    # back to the original anlyzer -- note that we have n:m mappings multiple
    # native ids can be mapped to a collection of semgrep rules and vice versa
    # every rule gets coordinates: original_rule_id-array index number
    suffix = ids.map { |id| "#{id}-#{id2rules[id].find_index(rfil) + 1}" }.join('.')
    newid = "#{prefix}.#{suffix}"
    rulefromfile['id'] = newid
    rulez[newid] = rulefromfile
  end

  outdict = { 'rules' => rulez.values }

  formatted = AutoFormat.reformat_yaml('', outdict)
  puts("writing #{prefix}.yml")
  File.open("rule-sets/#{prefix}.yml", 'w') { |file| file.write(formatted) }
end
