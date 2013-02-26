require 'nokogiri'
require 'open-uri'

class Zusaar
  def self.scrape(url)
    content = Nokogiri::HTML open('http://www.zusaar.com/event/539003').read

    entries = content.xpath("//ul[@class='lists even spaceC']/li//img/@src").map {|image|
      image.value
    }
    entries << content.xpath("//dl[@class='boxInfo']/dd/a/img/@src")[1].value

    entries
  end
end
