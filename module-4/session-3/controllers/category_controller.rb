require_relative '../models/item'
require_relative '../models/category'

class CategoryController

  def list_categories
    categories = Category.get_all_categories
    renderer = ERB.new(File.read('./views/category/index.erb'))
    renderer.result(binding)
  end

  def show_related_items(id)
    category = Category.get_category_by_id(id)
    items = Item.get_all_items(id.to_i)

    renderer = ERB.new(File.read('./views/category/details.erb'))
    renderer.result(binding)
  end

  def create_category
    renderer = ERB.new(File.read('./views/category/create.erb'))
    renderer.result(binding)
  end

  def insert_category(category_name)
    Category.insert_category(category_name)
  end

  def update_category_page(id)
    category = Category.get_category_by_id(id)
    renderer = ERB.new(File.read('./views/category/edit.erb'))
    renderer.result(binding)
  end

  def update_category(params)
    category_id = params["category_id"]
    category_name = params["category_name"]

    Category.update_category(category_id, category_name)
  end

  def delete_cateogry(category_id)
    Category.delete_cateogry(category_id)
  end

end
