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

      return ["no extesions known for #{lang}"] if ext.empty?

      Dir.glob("#{lang}/**/rule-*.yml").each do |file|
        dirname = File.dirname(file)
        base = File.basename(file, '.yml')
        test = "test-#{base.split('-')[1]}"
        testfilepath = "#{File.join(dirname, test)}.#{ext}"
        unless File.exist?(testfilepath)
          puts("no test case for #{file}: ✘")
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
