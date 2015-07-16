require 'rubygems'
require 'bundler/setup'

# requirements
require 'rss'
require 'open-uri'

require 'logging'

require 'database'
require 'setup'
require 'item'
require 'targets/base'
require 'targets/test'
require 'targets/diaspora'

class App

  @targets = ["TestTarget", "DiasporaTarget"]

  def self.read_and_post
    url = 'http://www.holarse-linuxgaming.de/rss.xml'
    open(url) do |rss|
      $logger.info("Parsing RSS-Feed #{url}")
      RSS::Parser.parse(rss).items.each do |item|
	@targets.each do |target|
	  Object.const_get(target).new(item).perform
	end
      end 
    end
  end
end

App.read_and_post
