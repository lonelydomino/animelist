class ProfileController < ApplicationController
    configure do 
        set :views, 'app/views'
    end

    get '/profile' do
        erb :'profile/show'
    end

end