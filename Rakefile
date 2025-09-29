# frozen_string_literal: true

require 'rake'

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  %w[zshrc gitignore gitconfig fdignore].each do |file|
    original = File.join(File.dirname(__FILE__), file)
    link = File.join(ENV['HOME'], ".#{file}")

    if File.exist?(File.join(ENV['HOME'], ".#{file}"))
      if replace_all
        replace_file(original, link)
      else
        print "overwrite #{file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(original, link)
        when 'y'
          replace_file(original, link)
        when 'q'
          exit
        else
          puts "skipping #{file}"
        end
      end
    else
      link_file(original, link)
    end
  end

  # Handle kitty on its own. Has a special location
  replace_all = false
  Dir['kitty/*'].each do |file|
    original = File.join(File.dirname(__FILE__), file)
    link = File.join(ENV['HOME'], '.config', file)

    if File.exist?(link)
      if replace_all
        replace_file(original, link)
      else
        print "overwrite #{file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(original, link)
        when 'y'
          replace_file(original, link)
        when 'q'
          exit
        else
          puts "skipping #{file}"
        end
      end
    else
      link_file(original, link)
    end
  end
end

def replace_file(original, link)
  system %(rm "#{link}")
  link_file(original, link)
end

def link_file(original, link)
  puts "linking #{original}"
  system %(ln -s "#{original}" "#{link}")
end
