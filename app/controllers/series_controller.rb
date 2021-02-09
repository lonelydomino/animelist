class AnimeController < ApplicationController
    configure do 
        set :views, 'app/views'
    end



    get '/animes/:animeid' do
        @animeid = params["animeid"]
        @details = API.new.get_anime_details(params["animeid"])
        erb :'animes/show'
    end

    get '/animes/:listid/add/:animeid' do
        @details = API.new.get_anime_details(params["animeid"])
        List.find(params["listid"]).animes << Anime.create(name: @details["name"], desc: @details["desc"], api_id: @details["id"], image: @details["image"])
        redirect :"/lists/#{params["listid"]}"
    end




    get '/animes/:listid/lists/:animeid' do
        @anime = Anime.find(params["animeid"])
        @list = List.find(params["listid"])
        erb :'animes/show'
    end


    delete '/animes/:listid/lists/:animeid/delete' do
        @anime = Anime.find(params["animeid"])
        @list = List.find(params["listid"])
        if @anime.destroy
            redirect "/lists/#{@list.id}"
        else
            redirect "/lists/#{@list.id}/animes/#{@anime.id}"
        end
    end

end