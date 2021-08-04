require './models/item'

describe Item do
  describe '#get_all_items' do
    context 'when it called without parameter' do
      it 'should not empty' do
        items = Item.get_all_items
        expect(items.empty?).to eq(false)
      end
    end

    context 'when it called with parameter (valid category_id)' do
      it 'should not empty' do
        items = Item.get_all_items(1)
        expect(items.empty?).to eq(false)
      end
    end

    context 'when it called with parameter (invalid category_id)' do
      it 'should empty' do
        items = Item.get_all_items(100)
        expect(items.empty?).to eq(true)
      end
    end

    context 'when it called with parameter -1' do
      it 'should not empty, because -1 indicates items which doesn\'t have a category' do
        items = Item.get_all_items(-1)
        expect(items.empty?).to eq(false)
      end
    end
  end
end