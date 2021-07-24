require 'sinatra'
require_relative './controllers/item_controller'
require_relative './controllers/category_controller'

# items
get '/items' do
	controller = ItemController.new
	controller.list_items
end

get '/items/:id/show' do
	controller = ItemController.new
	controller.show_item(params["id"])
end

get '/items/:id/edit' do
	controller = ItemController.new
	controller.show_item(params["id"], true)
end

get '/items/new' do
	controller = ItemController.new
	controller.create_item
end

post '/items/create' do
	controller = ItemController.new
	controller.insert_item(params)
	redirect '/items'
end

post '/items/update' do
	controller = ItemController.new
	controller.update_item(params)
	redirect '/items'
end

delete '/items/:id/delete' do
	controller = ItemController.new
	controller.delete_item(params["id"])
	redirect '/items'
end

# categories
get '/categories' do
	controller = CategoryController.new
	controller.list_categories
end

get '/categories/:id/show' do
	controller = CategoryController.new
	controller.show_related_items(params["id"])
end

get '/categories/new'do
	controller = CategoryController.new
	controller.create_category
end

get '/categories/:id/edit' do
	controller = CategoryController.new
	controller.update_category_page(params["id"])
end

post '/categories/create' do
	controller = CategoryController.new
	controller.insert_category(params["category_name"])
	redirect '/categories'
end

post '/categories/update' do
	controller = CategoryController.new
	controller.update_category(params)
	redirect '/categories'
end

delete '/categories/:id/delete' do
	controller = CategoryController.new
	controller.delete_cateogry(params["id"])
	redirect '/categories'
end
