class SharesController < ApplicationController
  def index
    @articles = Article.published.share.order(created_at: :desc)
  end
end
