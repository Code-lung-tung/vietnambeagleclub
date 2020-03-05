# frozen_string_literal: true

class TinymceImage < ApplicationRecord
  mount_uploader :file, PhotoUploader
end
