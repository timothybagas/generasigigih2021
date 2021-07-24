require_relative '../db/db_connector'

class Item
	attr_reader :id, :name, :price

	def initialize(params)
		@id = params["id"]
		@name = params["name"]
		@price = params["price"]
	end

	def self.get_all_items(get_category = nil)
		client = create_db_client
		result = client.query("SELECT * FROM items")
		items = Array.new
		
		result.each do |data|
			category_id = get_item_category_by_id(data["id"])
			next if category_id.nil?
			category_id = category_id["category_id"].to_i
			
			next if !(get_category.nil?) and (get_category != category_id)
			
			item = Item.new(data)
			items.push(item)
		end
	
		items
	end

	def self.get_item_by_id(target_id)
		client = create_db_client
		result = client.query("SELECT * FROM items WHERE id = #{target_id}")
		Item.new(result.first)
	end

	def self.get_item_category_by_id(id)
		client = create_db_client
		result = client.query("SELECT category_id FROM item_categories WHERE item_id = #{id}")
		result.first
	end

	def self.update_item_by_id(item_id, item_name, item_price, category_id)
		client = create_db_client

		client.query("UPDATE item_categories SET category_id = '#{category_id}' WHERE item_id = '#{item_id}'")
		client.query("UPDATE items SET name = '#{item_name}', price = '#{item_price}' WHERE id = '#{item_id}'")
	end

	def self.delete_item_by_id(id)
		client = create_db_client
		client.query("DELETE FROM item_categories WHERE item_id = #{id}")
		client.query("DELETE FROM items WHERE id = #{id}")
	end

	def self.insert_item(name, price, category_id)
		client = create_db_client
		client.query("INSERT INTO items (name, price) VALUES ('#{name}', '#{price}')")

		item_id = client.query("SELECT MAX(id) as id FROM items").first["id"]
		client.query("INSERT INTO item_categories (item_id, category_id) VALUES ('#{item_id}', '#{category_id}')")
	end

end
