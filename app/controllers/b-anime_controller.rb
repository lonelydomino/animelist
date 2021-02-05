class AnimeController < ApplicationController
    configure do 
        set :views, 'app/views'
    end
   
    get '/animes' do # LINK THATS IN BROWSER
        redirect_if_not_logged_in
        @animes = current_user.animes
        erb :'animes/index' # LINK TO ACTUAL FILE
    end

    get '/animes/new' do
        redirect_if_not_logged_in
        erb :'animes/new'
    end

    get '/animes/:id' do
        redirect_if_not_logged_in
        @anime = Anime.find(params["id"])
   
        erb :'animes/show' 
    end

    get '/animes/:id/edit' do
        redirect_if_not_logged_in
        @anime = Anime.find(params["id"])
        erb :'animes/edit'
    end    

    post '/animes' do
        @anime = Anime.new(params)
        if @anime.save
            current_user.animes << @anime
            #session[:alert] = "Character created!"
            redirect "/animes/#{@anime.id}"
        else
            redirect '/animes/new'
        end
    end

    patch '/animes/:id' do
        @anime = Anime.find(params["id"])

        if @anime.update(params[:anime])
            redirect "/animes/#{@anime.id}"
        else
            redirect "/animes/#{@anime.id}/edit"
        end
    end


    delete '/animes/:id/delete' do
        @anime = Anime.find(params["id"])
        if @anime.destroy
            redirect "/animes"
        else
            redirect "/animes/#{@anime.id}"
        end
    end
end