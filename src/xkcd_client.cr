require "http/client"
require "json"

class Xkcd_Client
    LATEST_COMIC=-1
    private BaseURL = "https://xkcd.com"

    getter :date, :safe_title, :alt

    @safe_title : JSON::Any
    @alt : JSON::Any

    def initialize(@comic_number=LATEST_COMIC)
        if @comic_number == LATEST_COMIC
            url = "#{BaseURL}/info.0.json"
        else
            url = "#{BaseURL}/#{@comic_number}/info.0.json"
        end
        response = HTTP::Client.get url
        jdata=JSON.parse response.body 
        @date="#{jdata["year"]}-#{jdata["month"]}-#{jdata["day"]}"
        @safe_title=jdata["safe_title"]
        @alt=jdata["alt"]
    end


    def saveToDisk

    end



end