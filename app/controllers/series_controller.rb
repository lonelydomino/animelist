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
        @new_anime = Anime.new(name: @details["name"], desc: @details["desc"], api_id: @details["id"], image: @details["image"])
        @list = List.find(params["listid"])
        @list.animes.each do |anime|
            if anime.name == @new_anime.name
                flash[:error] = "Anime already in list!"
  
                redirect "/animes/#{params["animeid"]}"
            end
        end
        if @list.save
            @list.animes << @new_anime
            redirect :"/lists/#{params["listid"]}"
        else
            redirect "/animes/#{params["animeid"]}"
         end
    end

    get '/lists/:listid/animes/:listanimeid/delete' do
        anime = Anime.find(params["listanimeid"])
        list = List.find(params["listid"])

        if anime.destroy
            redirect "/lists/#{list.id}"
        else
            flash[:error] = "Deletion error!"
            redirect "/lists/#{list.id}/animes/#{anime.id}"
        end
    end

end