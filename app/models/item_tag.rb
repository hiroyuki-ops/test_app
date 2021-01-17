class ItemTag
  include ActiveModel::Model
  attr_accessor :name, :user_id, :item_id, :tag_ids

  def save
    @item = Item.create(name: name, user_id: user_id)
    tag_list = tag_ids.split(/[[:blank:]]+/).select(&:present?)
    tag_list.each do |tag_name|
      @tag = Tag.where(word: tag_name).first_or_initialize
      @tag.save
      unless ItemTagRelation.where(item_id: @item.id,tag_id: @tag.id).exists?
        ItemTagRelation.create(item_id: @item.id, tag_id: @tag.id)
      end
    end
  end
end