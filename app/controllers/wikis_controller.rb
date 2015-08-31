# The is a controller for managing wikis
class WikisController < ApplicationController
  def index
  end

  def show
  end

  def new
    @wiki = Wiki.new
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

  def edit
  end

  def update
    if wiki.update_attributes(wiki_params)
      redirect_to wiki, notice: 'Wiki successfully updated.'
    else
      render :edit, error: 'Unable to update wiki. Please try again.'
    end
  end

  private

  def wikis
    @wikis ||= Wiki.all
  end

  def wiki
    @wiki ||= Wiki.find(params[:id])
  end

  def new_wiki
    @wiki ||= Wiki.new
  end

  def wiki_params
    params.require(:wiki).permit(:title, :body)
  end

  helper_method :new_wiki, :wikis, :wiki
end
