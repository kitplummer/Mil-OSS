require 'rubygems'
require 'phidgets4r'
require 'sinatra'

get '/move/:pos' do

  servo = Phidgets::Servo.new(-1, 2000)
  puts "device_id: #{servo.getDeviceID}"
  puts "device_name: #{servo.getDeviceName}"
  puts "status: #{servo.getDeviceStatus}"
  max = servo.getPositionMax(0)
  min = servo.getPositionMin(0)
  puts "min: #{min} - max: #{max}"
  servo.setPosition(0, 0.0)
  servo.setPosition(0, params[:pos].to_f)
  sleep 2


  position = servo.getPosition(0)
  servo.close
  servo.delete
  "moved to #{position}"
end
