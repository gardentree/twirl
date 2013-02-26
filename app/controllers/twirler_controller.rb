class TwirlerController < ApplicationController
  def card
    @elements = Zusaar.scrape(nil).map {|element|
      matches = element.scan(/(.+\/profile_images\/\d+\/.+?)(_[a-z]+)?(\.[a-z]+)/)[0]
      if matches
        "#{matches[0]}_bigger#{matches[2]}"
      else
        element
      end
    }.shuffle
  end
end
