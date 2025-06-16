#!/usr/bin/env ruby

require_relative '../create-link'

def main
  source_dir = File.dirname(__FILE__)
  target_base_dir = ENV['XDG_CONFIG_HOME'] || File.expand_path('~/.config')
  exclude_files = [File.basename(__FILE__)]

  success_count = 0
  total_count = 0
  
  Dir.glob(File.join(source_dir, '*')).each do |path|
    next if !File.directory?(path) && !File.file?(path)
    
    basename = File.basename(path)
    next if exclude_files.include?(basename)
    
    total_count += 1
    target_path = File.join(target_base_dir, basename)
    if create_link(basename, target_path, source_dir)
      success_count += 1
    end
  end
  
  puts "Completed: #{success_count}/#{total_count} links created"
end

main if __FILE__ == $0
