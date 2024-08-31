# frozen_string_literal: true

class Web::RepositoriesController < Web::ApplicationController
  def index
    @repositories = Repository.all
  end

  def new
    @repository = Repository.new
  end

  def show
    @repository = Repository.find params[:id]
  end

  def create
    repository = Repository.new(permitted_params)

    if repository.save
      repository.fetch!
      redirect_to repositories_path, notice: t('success')
    else
      flash[:notice] = t('fail')
      render :new, status: :unprocessable_entity
    end
  end

  def update
    Repository.find(params[:id]).fetch!
  end

  def update_repos
    Repository.all.order(repo_updated_at: :asc).map(&:fetch!)
  end

  def destroy
    @repository = Repository.find params[:id]

    if @repository.destroy
      redirect_to repositories_path, notice: t('success')
    else
      redirect_to repositories_path, notice: t('fail')
    end
  end

  private

  def permitted_params
    params.require(:repository).permit(:link)
  end
end
