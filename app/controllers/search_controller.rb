class SearchController < ApplicationController
    configure do 
        set :views, 'app/views'
    end

    get '/search' do
        api_obj = API.new
        @collection_data = api_obj.get_anime_collection
        erb :'/search/index'
    end

    get '/results' do
        api_obj = API.new
        @data = api_obj.search(params["search"]["query"])
        erb :'search/show'
    end


end