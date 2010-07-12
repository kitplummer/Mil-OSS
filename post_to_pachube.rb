#!/usr/bin/ruby

require 'rubygems'
require 'pachuber'
require 'eeml'

t = Thread.new do
  pachube_api_key = 'c2c52190262b5a066ed86fc4e8f57071248a2f66d73c98b87d109469b07144eb'

  LAT = 32.358098
  LON = -110.980960
  NAME = "Dozer Software"
  ELEVATION = 2545
  
  while true do
    f = File.new("/dev/ldusb0")
    packet = f.read(8)
    f.close
    parsed_packet = packet.unpack('ccsss')
    temp = parsed_packet[2]/128
    env = EEML::Environment.new

    env.location = EEML::Location.new(:physical, 
      :disposition => :fixed, 
      :exposure => :outdoor,
      :ele => ELEVATION,
      :lat => LAT,
      :lon => LON,
      :name => NAME)

    data = EEML::Data.new(temp)
    data.tags << "temperature"
    data.unit = EEML::Unit.new("Celsius", :symbol => 'C', :type => :derivedSI)
    env << data

    puts "OUTPUT: #{env.to_eeml}"

    pach = Pachube.new(pachube_api_key)
    resp = pach.update("/4077.xml", env.to_eeml)

    puts "RESPONSE: #{resp.code.to_s}"
    
    sleep 120
  end
end

t.join


  
