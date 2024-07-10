class HomesController < ApplicationController
 def index
    @posts = Post.where(status: 'published').order(published_date: :desc)
  end

end
