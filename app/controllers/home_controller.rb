class HomeController < ApplicationController
  def show
    @shouts = Shout.last(10)
  end
end