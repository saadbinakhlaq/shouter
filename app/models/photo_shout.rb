class PhotoShout < ActiveRecord::Base
  attr_accessor :image
  mount_uploader :image, ImageUploader

  def index
    image
  end
end
