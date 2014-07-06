class DishTypesController < ApplicationController
  before_action :set_dish_type, only: [:show, :edit, :update, :destroy]

  # GET /dish_types
  # GET /dish_types.json
  def index
    @dish_types = DishType.all
  end

  # GET /dish_types/1
  # GET /dish_types/1.json
  def show
  end

  # GET /dish_types/new
  def new
    @dish_type = DishType.new
  end

  # GET /dish_types/1/edit
  def edit
  end

  # POST /dish_types
  # POST /dish_types.json
  def create
    @dish_type = DishType.new(dish_type_params)

    respond_to do |format|
      if @dish_type.save
        format.html { redirect_to @dish_type, notice: 'Dish type was successfully created.' }
        format.json { render :show, status: :created, location: @dish_type }
      else
        format.html { render :new }
        format.json { render json: @dish_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dish_types/1
  # PATCH/PUT /dish_types/1.json
  def update
    respond_to do |format|
      if @dish_type.update(dish_type_params)
        format.html { redirect_to @dish_type, notice: 'Dish type was successfully updated.' }
        format.json { render :show, status: :ok, location: @dish_type }
      else
        format.html { render :edit }
        format.json { render json: @dish_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dish_types/1
  # DELETE /dish_types/1.json
  def destroy
    @dish_type.destroy
    respond_to do |format|
      format.html { redirect_to dish_types_url, notice: 'Dish type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish_type
      @dish_type = DishType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dish_type_params
      params.require(:dish_type).permit(:name, :plurial_name)
    end
end
