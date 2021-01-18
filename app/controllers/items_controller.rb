class ItemsController < ApplicationController

	def new
		@item = ItemTag.new
	end

	def create
		@item = ItemTag.new(itemtags_params)
		if @item.valid?
			@item.save
			redirect_to items_path(@item)
		else
			render :new
		end
	end

	private

	def itemtags_params
		params.repuire(:item_tag).permit(:name, :image, :tag_ids).merge(user_id: current_user.id)
	end
end
