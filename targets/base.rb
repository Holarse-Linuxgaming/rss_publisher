module Target
  def to_s
    "'#{@item.title}' (#{@item.guid.content})" 
  end

  def initialize(item)
    @item = item
  end

  def perform
    unless posted?
      begin
        post
        mark_as_posted
      rescue => e
	puts "Fehler beim Posten auf #{identify}: #{e.message}"
      end
    else
      puts "skipping #{self.to_s} auf #{identify}"
    end	
  end

  private

  def posted?
    Item.exists?(gid: @item.guid.content, target: identify)
  end

  def mark_as_posted
    Item.create(gid: @item.guid.content, target: identify)
  end

end
