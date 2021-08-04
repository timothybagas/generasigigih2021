require_relative '../models/item'
require_relative '../models/category'

class ItemController

  def list_items
    items = Item.get_all_items
    renderer = ERB.new(File.read("./views/item/index.erb"))
    renderer.result(binding)
  end

  def show_item(id, edit = false)
    item = Item.get_item_by_id(id)
    item_category = Category.get_category_by_id(
      Item.get_item_category_by_id(id)
    )

    categories = edit ? Category.get_all_categories : nil
    file = "./views/item/" + (edit ? "edit" : "details") + ".erb"

    renderer = ERB.new(File.read(file))
    renderer.result(binding)
  end

  def create_item
    categories = Category.get_all_categories
    renderer = ERB.new(File.read("./views/item/create.erb"))
    renderer.result(binding)
  end

  def insert_item(params)
    item_name = params["item_name"]
    item_price = params["item_price"]
    category_id = params["category_id"]

    Item.insert_item(item_name, item_price, category_id)
  end

  def update_item(params)
    item_id = params["item_id"]
    new_name = params["item_name"]

    new_price = params["item_price"]
    new_category_id = params["category_id"]

    Item.update_item_by_id(item_id, new_name, new_price, new_category_id)
  end

  def delete_item(id)
    Item.delete_item_by_id(id)
  end

end
