#!/usr/bin/env ruby

module FileCheck
  def self.run
    ok = true
    Dir.entries('./').select { |f| File.directory?(f) }.each do |lang|
      next if ['.git', '..', '.', 'ci'].include?(lang)

      ext = case lang
            when 'c'
              'c'
            when 'python'
              'py'
            else
              ''
            end

      next if ext.empty?

      Dir.glob("#{lang}/**/rule-*.yml").each do |file|
        dirname = File.dirname(file)

        if Dir.glob("#{dirname}/test-*.#{ext}").count.zero? 
          puts("no test cases in #{dirname}: ✘")
          ok = false
        end
      end
    end
    ok
  end
end

if FileCheck.run
  exit(0)
else
  exit(-1)
end
