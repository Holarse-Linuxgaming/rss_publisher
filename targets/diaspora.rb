class DiasporaTarget
  include Target

  def identify
    "diaspora"
  end

  private

  def post
    require 'diaspora-api'
    require 'nokogiri'
    require 'reverse_markdown'


    doc = Nokogiri::HTML(@item.description)

    content = @item.title << "\n"

    content << if @item.category.try(:content) == "News"
      doc = Nokogiri::HTML(@item.description)
      doc.xpath("//fieldset").remove
      doc.text.strip
    else  
      doc = Nokogiri::HTML(@item.description)
      doc.text.strip
    end

    content << " #holarse #linuxgaming #videogames"

    c = DiasporaApi::Client.new
    c.login('https://pod.geraspora.de/', 'holarse', ENV['holarse_diaspora_pw'])
    c.post(content, '')
  end

end
