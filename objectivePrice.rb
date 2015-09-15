#!/usr/bin/ruby
# coding: utf-8
# This script will check www.guenstiger.de, whether there is a drop in
# price for a camera objective I want.


require 'rubygems'
require 'mechanize'
require 'mail'

url = 'http://www.guenstiger.de/Produkt/Nikon/AF_S_DX_Nikkor_18_200mm_1_3_5_5_6_G_ED_VR_II.html'
file = '/home/tim/.nikkor18-200-price'

Mail.defaults do
  delivery_method :smtp, address: "emrys-merlin.de"
end

agent = Mechanize.new
price = nil

agent.get(url) do |page|
  price = page.title.split('€').last.split(')').first.gsub(",",".").to_f
end

if File.exist?(file)
  File.open(file, "r") do |f|
    old_price = f.each_line.first.to_f

    if old_price > price
      Mail.deliver do
        from 'tim@emrys-merlin.de'
        to 'tim@emrys-merlin.de'
        subject 'Nikon AF-S DX Nikkor 18-200mm 1:3,5-5,6 G ED VR II
      Objektiv has fallen in price'
        body "Hi Tim,\n\n The new price is #{price}. Before it was at" +
             " #{old_price}.\n\n Best regards,\n Tim"
      end
    else
      price = old_price
    end
  end
end

File.open(file, "w") do |f|
  f.puts price
end
