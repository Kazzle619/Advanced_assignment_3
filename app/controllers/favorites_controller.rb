class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @favorite = Favorite.new(
      user_id: current_user.id,
      book_id: params[:book_id]
    )
    @favorite.save
    redirect_to request.referrer
  end

  def destroy
    @favorite = Favorite.find_by(
      user_id: current_user.id,
      book_id: params[:book_id]
    )
    @favorite.delete #destroyだと何故かNoMethodErrorが出る。多分belongs_toが原因
    redirect_to request.referrer
  end
end
