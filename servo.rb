require 'rubygems'
require 'phidgets4r'

servo = Phidgets::Servo.new(-1, 2000)
puts "device_id: #{servo.getDeviceID}"
puts "device_name: #{servo.getDeviceName}"
puts "status: #{servo.getDeviceStatus}"
max = servo.getPositionMax(0)
min = servo.getPositionMin(0)
puts "min: #{min} - max: #{max}"
servo.setPosition(0, 0.0)
servo.setPosition(0, 0.0)
sleep 2
servo.setPosition(0, 220.0)
sleep 2
servo.setPosition(0, 100.0)

position = servo.getPosition(0)
servo.close
servo.delete
