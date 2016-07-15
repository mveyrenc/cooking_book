class SourcesController < ApplicationController
  before_action :set_source, only: [:show, :edit, :update, :destroy]

  def index
    authorize! :read, Source
    if params[:search]
      search = params[:search].downcase
      @sources = Source.where("lower(name) LIKE :search",{search: "#{search}%"}).order( :name ) + Source.where("lower(name) LIKE :search_like AND lower(name) NOT LIKE :search_not_like",{search_like: "%#{search}%", search_not_like: "#{search}%"}).order( :name )
    else
      @sources = Source.roots
    end
  end

  def show
    authorize! :read, Source
  end

  def new
    authorize! :create, Source
    @source = Source.new
    @source.parent_id = params[:parent_id] if params[:parent_id]
  end

  def edit
    authorize! :update, @source
  end

  def create
    authorize! :create, Source
    @source = Source.new(source_params)
    
    @source.author = current_user
    @source.modifier = current_user
    
    respond_to do |format|
      if @source.save
        anchor = @source.is_root? ? @source.slug : @source.parent.slug
        format.html { redirect_to sources_url + '#' + anchor, notice: t('.success') }
        format.json { render :show, status: :created, location: @source }
      else
        format.html { render :new }
        format.json { render json: @source.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize! :update, @source
    
    @source.modifier = current_user
    
    respond_to do |format|
      if @source.update(source_params)
        format.html { redirect_to sources_url + '#' + @source.slug, notice: t('.success') }
        format.json { render :show, status: :ok, location: @source }
      else
        format.html { render :edit }
        format.json { render json: @source.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize! :destroy, @source
    @source.destroy
    respond_to do |format|
      anchor = @source.is_root? ? '' : '#' + @source.parent.slug
      format.html { redirect_to sources_url + anchor, notice: t('.success') }
      format.json { head :no_content }
    end
  end

  private
  def set_source
    @source = Source.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def source_params
    params.require(:source).permit(:name, :parent_id)
  end
end
