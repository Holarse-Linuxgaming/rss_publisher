unless ActiveRecord::Base.connection.table_exists?(:items)
  ActiveRecord::Base.connection.create_table :items do |t|
    t.string :target
    t.string :gid
  end
end
