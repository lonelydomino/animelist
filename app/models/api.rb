class API
    attr_accessor :json_data, :anime_collection


    def get_anime_details(id)
        response = RestClient.get "https://kitsu.io/api/edge/anime/#{id}"
        json = JSON.parse(response)
        data = json["data"]
        id = data["id"]
        desc = data["attributes"]["description"]
        title = data["attributes"]["titles"]["en"]
        image = data["attributes"]["posterImage"]["small"]
     end

     def get_anime_collection
        response = RestClient.get "https://kitsu.io/api/edge/anime/"
        json = JSON.parse(response)
        @anime_collection = json["data"]
        @anime_collection
     end

     def search(string)
        string.gsub!(/\s/,'%20')
        response = RestClient.get "https://kitsu.io/api/edge/anime?filter[text]=#{string}"
        json = JSON.parse(response)
        @json_data = json["data"]
        @json_data
     end


end

