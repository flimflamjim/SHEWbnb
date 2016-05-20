class Makersbnb < Sinatra::Base

  get '/places/new' do
    erb :'places/new'
  end

  get '/places' do
    @places = Place.all
    erb :'places/index'
  end

  post '/places' do
    user = User.get(session[:user_id])
    start_date_obj = Date.parse(params[:start_date])
    end_date_obj = Date.parse(params[:end_date])
    place = Place.create(
      name: params[:name],
      description: params[:description],
      price: params[:price].to_i,
      user_id: user.id,
      username: user.username)
    availability = Availability.create(
      start_date: start_date_obj,
      end_date: end_date_obj,
      place_id: place.id)
    redirect '/places'
  end

  get '/places/manage' do
    @places = Place.all(user_id: params[:id])
    erb :'places/manage'
  end

  get '/places/manage/availability' do
    @place = Place.first(params[:id])
    @availabilities = Availability.all(:place_id => @place.id)
    erb :'places/manage_availability'
  end

  post '/places/manage/availability' do
    start_date_obj = Date.parse(params[:start_date])
    end_date_obj = Date.parse(params[:end_date])
    availability = Availability.create(
      start_date: start_date_obj,
      end_date: end_date_obj,
      place_id: params[:id])
    redirect '/places/manage/availability'
  end
end
