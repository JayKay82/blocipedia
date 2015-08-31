# The is a controller for managing wikis
class WikisController < ApplicationController
  def index
  end

  def new
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user
    if @wiki.save
      redirect_to root_path, notice: 'Successfully created a new wiki'
    else
      render :new, error: 'Unable to create a new wiki. Please try again.'
    end
  end

  private

  def wikis
    @wikis ||= Wiki.all
  end

  def new_wiki
    @wiki ||= Wiki.new
  end

  def wiki_params
    params.require(:wiki).permit(:title, :body)
  end

  helper_method :new_wiki, :wikis
end
