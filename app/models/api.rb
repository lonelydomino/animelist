class API
    attr_accessor :json_data

    def search(key_word)
        key_word.gsub!(/\s/,'%20')
        url = URI("https://simpleanime.p.rapidapi.com/anime/search/#{key_word}")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        
        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-key"] = '06e6a40aacmshb6bf882e49d2f38p15b016jsnfff68491c4f3'
        request["x-rapidapi-host"] = 'simpleanime.p.rapidapi.com'
        
        response = http.request(request)
        json = JSON.parse(response.read_body)
        @json_data = json["data"]
    end
end
# To grab anime title:
#
# a.json_data["data"][0]["title"]
#
# To grab image of anime:
#
# a.json_data["data"][0]["cover"]   