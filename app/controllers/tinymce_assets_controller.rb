# frozen_string_literal: true

class TinymceAssetsController < ApplicationController
  respond_to :json

  def create
    geometry = Paperclip::Geometry.from_file params[:file]
    image    = TinymceImage.create params.permit(:file, :alt, :hint)

    render json: {
      image: {
        url:    image.reload.file_url,
        height: geometry.height.to_i,
        width:  geometry.width.to_i
      }
    }, layout: false, content_type: 'text/html'
  end
end
