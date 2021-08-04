require_relative '../db/db_connector'

class Category
	attr_reader :id, :name

	def initialize(params)
		@id = params["id"]
		@name = params["name"]
	end

	def self.get_all_categories
		client = create_db_client
		result = client.query("SELECT * FROM categories")
		categories = Array.new
	
		result.each do |data|
			category = Category.new(data)
			categories.push(category)
		end
	
		categories
	end

	def self.get_category_by_id(id)
		client = create_db_client
		result = client.query("SELECT * FROM categories WHERE id = #{id}")
		Category.new(result.first.nil? ?
			{"id" => -1, "name" => "-"} : result.first)
	end

	def self.insert_category(category_name)
		client = create_db_client
		client.query("INSERT INTO categories (name) VALUES ('#{category_name}')")
	end

	def self.update_category(category_id, new_name)
		client = create_db_client
		client.query("UPDATE categories SET name = '#{new_name}' WHERE id = '#{category_id}'")
	end

	def self.delete_cateogry(category_id)
		client = create_db_client
		client.query("DELETE FROM item_categories WHERE category_id = '#{category_id}'")
		client.query("DELETE FROM categories WHERE id = '#{category_id}'")
	end
	
end
