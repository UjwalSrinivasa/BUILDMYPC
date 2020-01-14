class StaticPagesController < ApplicationController
  def home
  	render layout: "statics"
  end

  def help
  end

  def about
  end

  def contact
  end
end
