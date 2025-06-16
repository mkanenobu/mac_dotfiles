#!/usr/bin/env ruby

require 'fileutils'

def create_link(file_name, target_path, source_dir = nil)
  source_dir ||= File.dirname(__FILE__)
  source_path = File.expand_path(File.join(source_dir, file_name))

  expanded_target_path = File.expand_path(target_path)
  target_dir = File.dirname(expanded_target_path)

  if !File.directory?(target_dir)
    FileUtils.mkdir_p(target_dir)
  end

  if File.symlink?(expanded_target_path)
    puts "#{expanded_target_path} is already a symlink. Removing and recreating..."
    File.unlink(expanded_target_path)
  elsif File.exist?(expanded_target_path)
    puts "#{expanded_target_path} already exists (not a symlink). Skipping."
    return false
  end

  begin
    File.symlink(source_path, expanded_target_path)
    puts "#{source_path} -> #{expanded_target_path}"
    return true
  rescue => e
    puts "Error: #{e.message}"
    return false
  end
end
