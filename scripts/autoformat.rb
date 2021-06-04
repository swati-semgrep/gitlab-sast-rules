#!/usr/bin/env ruby

require 'psych'
require 'justify'
require 'yaml'
require 'fileutils'

module AutoFormat
  def self.run
    changed = 0
    Dir.glob('**/*.yml').each do |file|
      ff = File.read(file)
      yaml_dict = YAML.load(ff)
      # extract comments
      comments = ff.scan(/^#.*?$/)
      comments.filter! { |r| !r.include?('yamllint') }

      next if yaml_dict == false

      ast = Psych.parse_stream(Psych.dump(yaml_dict))

      # apply double quotes
      ast.grep(Psych::Nodes::Scalar).each do |node|
        node.plain  = false
        node.quoted = true
        node.style  = Psych::Nodes::Scalar::DOUBLE_QUOTED
      end

      # Second pass, unquote keys
      ast.grep(Psych::Nodes::Mapping).each do |node|
        node.children.each_slice(2) do |k, v|
          k.plain  = true
          k.quoted = false
          k.style  = Psych::Nodes::Scalar::ANY

          if k.value == 'message' || k.value == 'pattern-inside'
            v.value = v.value.justify(100)
            v.style = Psych::Nodes::Scalar::LITERAL
          end
        end
      end

      File.open("#{file}_tmp", 'w') do |f|
        if comments.any?
          f.puts('# yamllint disable')
          f.puts(comments) if comments.any?
          f.puts('# yamllint enable')
        end
        f.puts(ast.to_yaml)
      end

      if FileUtils.identical?(file, "#{file}_tmp")
        puts("#{file}: ✔")
        FileUtils.rm("#{file}_tmp")
      else
        changed += 1
        puts("#{file}: ✘")
        FileUtils.mv("#{file}_tmp", file)
      end
    end
    changed
  end

  def self.make_quoted(value)
    value.style = Psych::Nodes::Scalar::DOUBLE_QUOTED
    value.quoted = true
  end
end

changed = AutoFormat.run

puts "#{changed} formatted files"

exit(-1) if changed > 0

exit(0)
