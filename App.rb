require 'rubygems'
require 'bundler/setup'

# requirements
require 'rss'
require 'open-uri'

require 'database'
require 'setup'
require 'item'
require 'targets/base'
require 'targets/test'

class App
  def self.read_and_post
    url = 'http://www.holarse-linuxgaming.de/rss.xml'
    open(url) do |rss|
      feed = RSS::Parser.parse(rss)
      puts "Title: #{feed.channel.title}"
      feed.items.each do |item|
        TestTarget.new(item).perform
      end 
    end
  end
end

App.read_and_post
