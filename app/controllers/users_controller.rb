class UsersController < ApplicationController

	def index
		@users = User.all
		respond_to do |format|
			format.json { render :json => @users.to_json(:include => :tag) }
		end
	end

	def show
		@user = User.find(params[:id])

		respond_to do |format|
			format.json { render :json => @user.to_json(:include => :tag) }
		end
	end

	def create
		@user = User.new(user_params)

		respond_to do |format|
			if @user.save
				format.json { render :json => @user.to_json(:include => :tag), :status => :created, :location => @user }
			else
				format.json { render :json => @user.errors, :status => :unprocessable_entity }
			end
		end
	end

	def update
		@user = User.find(params[:id])

		respond_to do |format|
			if @user.update_attributes(user_params)
				format.json { head :ok }
			else
				format.json { render :json => @user.errors, :status => :unprocessable_entity }
			end
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy

		respond_to do |format|
			format.json { head :ok }
		end
	end

	def user_for_vendor_id
		@user = User.where(vendor_id: params['vendor_id']).first

		if !@user
			error = 'User for this vendor ID does not exist.'
			render :json => error.to_json
		else
			respond_to do |format|
				format.json { render :json => @user.to_json(:include => :tag) }
			end
		end
	end

	def index_no_id
		@users = User.all
		respond_to do |format|
			format.json { render :json => @users.to_json(:include => :tag, :except => :vendor_id) }
		end
	end

	protected
	def user_params
  		params.require(:user).permit(:tag_id, :vendor_id, :latitude, :longitude)
	end
end