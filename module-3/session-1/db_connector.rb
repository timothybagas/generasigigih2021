require 'mysql2'
require_relative './item'
require_relative './category'

def create_db_client
	Mysql2::Client.new(
		:host => "localhost",
		:username => "root",
		:password => "",
		:database => "food_oms_db")
end

def get_all_items
	client = create_db_client
	rawData = client.query("SELECT * FROM items")
	items = Array.new
	
	rawData.each do |data|
		item = Item.new(data["id"], data["name"], data["price"])
		items.push(item)
	end

	items
end

def get_all_categories
	client = create_db_client
	rawData = client.query("SELECT * FROM categories")
	categories = Array.new

	rawData.each do |data|
		category = Category.new(data["id"], data["name"])
		categories.push(category)
	end

	categories
end

def get_all_items_with_categories
	client = create_db_client
	rawData = client.query("SELECT items.id, items.name, items.price, categories.id AS category_id, categories.name AS category_name 
		FROM items 
		JOIN item_categories ON items.id = item_categories.item_id 
		JOIN categories ON item_categories.category_id = categories.id")

	items = []

	rawData.each do |data|
		category = Category.new(data["category_id"], data["category_name"])
		item = Item.new(data["id"], data["name"], data["price"], category)
		items[data["id"]] = item
	end

	items
end

def insert_item(item_name, item_price)
	client = create_db_client
	client.query("INSERT INTO items (name, price) VALUES ('#{item_name}', '#{item_price}')")
end

def insert_item_with_category(item_name, item_price, category_id)
	client = create_db_client
	client.query("INSERT INTO items (name, price) VALUES ('#{item_name}', '#{item_price}')")

	client.query("INSERT INTO item_categories (item_id, category_id) VALUES ((SELECT MAX(id) FROM items), #{category_id})")
end

def update_item(item_id, item_name, item_price, category_id)
	client = create_db_client
	
	client.query("UPDATE items SET name = '#{item_name}', price = #{item_price} WHERE id = #{item_id}")

	client.query("UPDATE item_categories SET category_id = #{category_id} WHERE item_id = #{item_id}")
end

def delete_item(item_id)
	client = create_db_client
	client.query("DELETE FROM item_categories WHERE item_id = #{item_id}")
	client.query("DELETE FROM items WHERE id = #{item_id}")
end
