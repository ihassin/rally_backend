class TagsController < ApplicationController

	def index
		@tags = Tag.all
		respond_to do |format|
			format.json { render :json => @tags.to_json }
		end
	end

	def show
		@tag = Tag.find(params[:id])

		respond_to do |format|
			format.json { render :json => @tag.to_json }
		end
	end

	def create
		@tag = Tag.new(tag_params)

		respond_to do |format|
			if @tag.save
				format.json { render :json => @tag.to_json, :status => :created, :location => @tag }
			else
				format.json { render :json => @tag.errors, :status => :unprocessable_entity }
			end
		end
	end

	def update
		@tag = Tag.find(params[:id])

		respond_to do |format|
			if @tag.update_attributes(tag_params)
				format.json { head :ok }
			else
				format.json { render :json => @tag.errors, :status => :unprocessable_entity }
			end
		end
	end

	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy

		respond_to do |format|
			format.json { head :ok }
		end
	end

	protected
	def tag_params
  		params.require(:tag).permit(:name)
	end
end