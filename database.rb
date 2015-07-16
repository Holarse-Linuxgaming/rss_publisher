require 'active_record'
ActiveRecord::Base.establish_connection adapter: 'derby', database: 'db/rssfeeds'
