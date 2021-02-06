class AnimeController < ApplicationController
    configure do 
        set :views, 'app/views'
    end

    get '/lists/:listid/animes/:animeid' do
        @anime = Anime.find(params["animeid"])
        @list = List.find(params["listid"])
        erb :'animes/show'
    end


    delete '/lists/:listid/animes/:animeid/delete' do
        @anime = Anime.find(params["animeid"])
        @list = List.find(params["listid"])
        binding.pry
        if @anime.destroy
            redirect "/lists/#{@list.id}"
        else
            redirect "/lists/#{@list.id}/animes/#{@anime.id}"
        end
    end

end