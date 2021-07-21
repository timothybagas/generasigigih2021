require 'sinatra'
require_relative 'db_connector'

get '/' do
	items = get_all_items_with_categories
	erb :index, locals: {
		items: items
	}
end

get '/items/:id/show'do
	id = params["id"].to_i
	item = get_all_items_with_categories[id]

	erb :details, locals: {
		item: item
	}
end

get '/items/:id/edit' do
	id = params["id"].to_i
	item = get_all_items_with_categories[id]
	categories = get_all_categories

	erb :edit, locals: {
		item: item,
		categories: categories
	}
end

get '/items/:id/delete' do
	item_id = params["id"]
	delete_item(item_id)
	redirect '/'
end

get '/items/new' do
	categories = get_all_categories
	erb :create, locals: {
		categories: categories
	}
end

post '/items/create' do
	item_name = params["item_name"]
	item_price = params["item_price"]
	category_id = params["category_id"]
	
	insert_item_with_category(item_name, item_price, category_id)
	redirect '/'
end

post '/items/update' do
	item_id = params["item_id"]
	item_name = params["item_name"]
	item_price = params["item_price"]
	category_id = params["category_id"]

	update_item(item_id, item_name, item_price, category_id)
	redirect '/'
end
