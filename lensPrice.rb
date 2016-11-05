#!/usr/bin/ruby
# coding: utf-8
#
# Again a script for finding Lens prices. A little bit more
# involved than the first one

require 'rubygems'
require 'mechanize'
require 'mail'

# parser for the config file
# lensSites parses the lenss and their sites
# default parses the rest
require_relative 'lensSites.rb'
require_relative 'default.rb'

Dir.chdir(File.expand_path(File.dirname(__FILE__)))

# does the config file exist? It better did.
unless File.exist?('./config.rb')
  puts 'It seems that the config file config.rb does not exist. ' \
       'Please create it in your working directory. There ' \
       'should have been an example file shipped with this.'
  exit 1
end
require_relative 'config.rb'

# Setup mail server
Mail.defaults do
  delivery_method :smtp, address: Default.server, port: 3333
end

body = Default.opening
send_mail = false

# Create directory or check existance of the directoryin which the
# price development for the items will be stored.
unless Dir.exist?(Default.path)
  begin
    Dir.mkdir Default.path
  rescue SystemCallError
    puts 'The directory specified in config.rb cannot be' \
         ' created. Please look into this.'
    exit 1
  end
end

# Open browser
agent = Mechanize.new

LensSites.each do |obj|
  agent.get(obj.url) do |page|
    price =
      page.title.split('€').last.split(')').first.tr(',', '.').to_f
    File.open(Default.path + '/' + obj.name, 'a+') do |f|
      lines = f.each_line.to_a
      old_price = Float::INFINITY
      min_price = Float::INFINITY
      unless lines.empty?
        old_price = lines.last.split("\t")[1].to_f
        min_price = lines.last.split("\t").last.to_f
      end

      uri = page.links_with(text: 'Zum Shop')[1].click.uri.to_s

      if price < old_price
        send_mail = true
        body += 'Name: ' + obj.name + "\n" \
                'Old: ' + old_price.to_s + "\n" \
                'New: ' + price.to_s + "\n" \
                'Min: ' + min_price.to_s + "\n" \
                'Shop: ' + uri + "\n\n"
        min_price = price if price < min_price
      end

      f.puts(DateTime.now.to_s + "\t" + price.to_s + "\t" + uri + "\t" +
             min_price.to_s)
    end
  end
end

if send_mail
  body += Default.closing

  Mail.deliver do
    from Default.from
    to Default.to
    subject Default.subject
    body body
  end
end
