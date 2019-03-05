class IdeasController < ApplicationController
  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new idea_params
    if @idea.save
      flash[:notice] = "Idea successfully created"
      redirect_to idea_path(@idea)
    else
      render "new"
    end
  end

  def show
    # params.require(:idea).permit(:title, :description)
    @idea = Idea.find(params[:id])
  end

  def index
    @ideas = Idea.order(created_at: :desc)
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update(idea_params)
      flash[:notice] = "Idea successfully updated!"
      redirect_to @idea
    else
      flash.now[:alert] = @idea.errors.fulsl_messages.join(", ")
      render :edit
    end
  end

  def destroy
    #@idea = Idea.find(params[:id])
    #@idea.destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    flash[:notice] = "Idea Deleted!"
    redirect_to ideas_path
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description)
  end
end
