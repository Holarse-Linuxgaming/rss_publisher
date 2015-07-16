class TestTarget
  include Target

  def identify
    "test"
  end

  private

  def post
    $logger.info("posting #{self} to #{identify}")
  end

end
