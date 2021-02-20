class ListsController < ApplicationController

    configure do 
        set :views, 'app/views'
    end
   
    get '/lists' do
        redirect_if_not_logged_in
        @lists = current_user.lists
        binding.pry
        erb :'lists/index'
    end

    get '/lists/new' do
        redirect_if_not_logged_in
        erb :'lists/new'
    end

    get '/lists/:id' do
        redirect_if_not_logged_in
        if List.exists?(params[:id])
            @list = List.find(params["id"])
            erb :'lists/show'
        else
            redirect 'lists' 
        end
    end

    get '/lists/:id/edit' do
        redirect_if_not_logged_in
        @list = List.find(params["id"])
        erb :'lists/edit'
    end    

    post '/lists' do
        list = List.new(params)
        list.desc = "No description" if list.desc == ""
        current_user.lists.each do |l|
            if list.name == l.name
                flash[:error] = "List name already exists!"
                redirect '/lists/new'
            end
            if list.name == ""
                flash[:error] = "List name cannot be blank!"
                redirect '/lists/new'
            end
        end
        if list.save
            current_user.lists << list
            redirect "/lists/#{list.id}"
        else
            redirect '/lists/new'
        end
    end

    patch '/lists/:id' do
        list = List.find(params["id"])
        if List.find_by_name(params["list"]["name"])
            flash[:error] = "List name already exists!"
            redirect "/lists/#{list.id}/edit"
        end
        if @list.update(params[:list])
            redirect "/lists/#{list.id}"
        else
            redirect "/lists/#{list.id}/edit"
        end
    end


    delete '/lists/:id/delete' do
        list = List.find(params["id"])
        if list.destroy
            redirect "/lists"
        else
            redirect "/lists/#{list.id}"
        end
    end
end