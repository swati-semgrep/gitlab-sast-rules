#!/usr/bin/env ruby

require 'psych'
require 'yaml'
require 'fileutils'

module StringUtils
  def self.wrap(txt, col = 80)
    txt.gsub(/(.{1,#{col}})( +|$\n?)|(.{1,#{col}})/,
             "\\1\\3\n").gsub(/^# *$/, '')
  end
end

module AutoFormat
  def self.run
    changed = 0
    Dir.glob('**/rule-*.yml').each do |file|
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

      # remove double quotes from keys and adjust
      # message, pattern-inside and pattern
      ast.grep(Psych::Nodes::Mapping).each do |node|
        node.children.each_slice(2) do |k, v|
          k.plain  = true
          k.quoted = false
          k.style  = Psych::Nodes::Scalar::ANY

          case k.value
          when 'message'
            v.quoted = true
            v.plain = true
            v.style = Psych::Nodes::Scalar::LITERAL
            v.value = StringUtils.wrap(v.value.delete("\n"), 100)
          when 'pattern'
            v.style = if v.value.count("\n").zero?
                        Psych::Nodes::Scalar::DOUBLE_QUOTED
                      else
                        Psych::Nodes::Scalar::LITERAL
                      end
          when 'pattern-inside'
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
