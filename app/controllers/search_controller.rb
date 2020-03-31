class SearchController < ApplicationController
  before_action :find_dog, :set_metas, except: :index
  before_action :init_search

  def index
    @dogs = @q.result(distinct: true).page(params[:page]).per(20)
  end

  def details
  end

  def relative
    @siblings = Dog.siblings(@dog)
    @half_brothers = Dog.half_brother(@dog, :father)
  end

  def descendant
    @descendants = Dog.offspring(@dog)
  end

  def genealogy
  end

  def genealogy_result
    @depth = params[:depth].to_i
    @genealogy = @dog.genealogy(@depth)
  end

  private

  def find_dog
    @dog = Dog.friendly.find(params[:id])
  end

  def set_metas
    @meta_image = @dog.photos.first&.image_url
    @meta_title = @dog.name
    @meta_description = @dog.description
  end

  def init_search
    @q = Dog.ransack(params[:q])
  end
end
