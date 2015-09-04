# The is a controller for managing wikis
class WikisController < ApplicationController
  def index
  end

  def show
    if wiki.readable_by?(current_user)
      @wiki
    else
      redirect_to wikis_path, alert: 'Update to Premium in order to view private wikis.'
    end
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

  def destroy
    if wiki.destroy
      redirect_to wikis_path, notice: 'Successfully deleted wiki.'
    else
      redirect_to wiki, notice: 'Unable to delete wiki. Please try again.'
    end
  end

  private

  def wikis
    if current_user.admin?
      @wikis ||= Wiki.all
    else
      @wikis = []
      Wiki.all.each do |wiki|
        @wikis << wiki if wiki.readable_by?(current_user)
      end
      @wikis
    end
  end

  def wiki
    @wiki ||= Wiki.friendly.find(params[:id])
    # unless @wiki.readable_by?(current_user)
    #   redirect_to wikis_path, alert: 'Update to Premium in order to view private wikis.'
    # end
    #raise ActiveRecord::RecordNotFound unless @wiki.readable_by?(current_user)
  end

  def new_wiki
    @wiki ||= Wiki.new
  end

  def wiki_params
    if current_user.premium?
      params.require(:wiki).permit(:title, :body, :private, collaboration_user_ids: [])
    else
      params.require(:wiki).permit(:title, :body)
    end
  end

  helper_method :new_wiki, :wikis, :wiki
end
