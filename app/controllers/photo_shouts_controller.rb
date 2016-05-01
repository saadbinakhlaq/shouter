class PhotoShoutsController < ApplicationController
  def create
    content = build_content
    shout = current_user.shouts.build(content: content)

    if shout.save
      redirect_to dashboard_path
    else
      redirect_to dashboard_path, notice: 'not created!'
    end
  end

  private

  def build_content
    PhotoShout.new(photo_shouts_parameters)
  end

  def photo_shouts_parameters
    params.require(:photo_shout).permit(:image)
  end
end