class TestTarget
  include Target

  def identify
    "test"
  end

  private

  def post
    puts "posting #{self} to #{identify}"
  end

end
