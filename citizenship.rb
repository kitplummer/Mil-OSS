#!/usr/bin/env ruby
require 'rubygems'
require 'slider'
include Slider

set_columns 80
set_rows 24
set_figlet_font 'digital'

slide "Citizenship", "Doing _Our_ Part"
slide "OSS is a Meritocracy", "Perception is Relevant", "Not All Participation is Equal", "Where Are We?"
slide "Slider Source Code?", "http://www.github.com/kitplummer"

start_slideshow
