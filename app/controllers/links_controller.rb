class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
      @links = Link.where(user: current_user)
    else
      @links = Link.anon_link.recent_first
    end
    @link ||= Link.new
  end

  def new
    @link = Link.new
  end

  def create
    user = current_user || User.null_user
    @link = Link.new(link_params)
    @link.user_id = user.id

    if @link.save!
      respond_to do |format|
        format.html { redirect_to root_path }
        format.turbo_stream { render turbo_stream: turbo_stream.prepend("links", @link) }
      end
    else
      index
      render :index, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @link.is_editable? && @link.update(link_params)
      redirect_to @link
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @link.is_editable?
      @link.destroy
      redirect_to root_path, notice: "Link has been deleted"
    else
      redirect_to root_path, alert: "Anonymous link cannot be deleted"
    end
  end

  def show
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end

