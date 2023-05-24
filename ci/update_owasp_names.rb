#!/usr/bin/env ruby
# Standardise the OWASP metadata for each mapped rule

require 'yaml'

OWASP = {
    "1": "A1:2017-Injection",
    "2": "A2:2017-Broken Authentication",
    "3": "A3:2017-Sensitive Data Exposure",
    "4": "A4:2017-XML External Entities (XXE)",
    "5": "A5:2017-Broken Access Control",
    "6": "A6:2017-Security Misconfiguration",
    "7": "A7:2017-Cross-Site Scripting (XSS)",
    "8": "A8:2017-Insecure Deserialization",
    "9": "A9:2017-Using Components with Known Vulnerabilities",
    "10": "A10:2017-Insufficient Logging & Monitoring",
}

def update_owasp(rule_path)
    yaml_file_path = "#{rule_path}.yml"
    file_contents = File.read(yaml_file_path)
    rule = YAML.load(file_contents)
    rule['rules'].each do |r|
        owasp = r['metadata']['owasp']
        if !owasp.nil? && !owasp.empty?
            owasp_code = r['metadata']['owasp'].split(":")[0].gsub(/A0?/, "")
            new_contents = file_contents.gsub(r['metadata']['owasp'], OWASP[owasp_code.to_sym])
            File.open(yaml_file_path, "w") {|file| file.puts new_contents }
        end
    end
end

Dir.glob('./mappings/*.yml').each do |file|
    mappings = YAML.load(File.read(file))
    base = File.basename(file, ".yml")
    mappings[base]['mappings'].each do |mapping|
        mapping['rules'].each do |rule|
            update_owasp(rule['path'])
        end
    end
end