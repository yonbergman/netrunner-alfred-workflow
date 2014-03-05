#!/usr/bin/env ruby
# encoding: utf-8

$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))

require 'rubygems' unless defined? Gem # rubygems is only needed in 1.8
require "bundle/bundler/setup"
require "alfred"
require File.join(File.expand_path(File.dirname(__FILE__)),'lib/card_finder.rb')

Alfred.with_friendly_error do |alfred|
  alfred.with_rescue_feedback = true

  card_finder = CardFinder.new()
  puts card_finder.run(alfred, ARGV[0])
end
