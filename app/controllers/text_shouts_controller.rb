class TextShoutsController < ApplicationController
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
    TextShout.new(text_shouts_parameters)
  end

  def text_shouts_parameters
    params.require(:text_shout).permit(:body)
  end
end