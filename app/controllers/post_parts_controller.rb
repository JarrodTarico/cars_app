class PostPartsController < ApplicationController
  before_action :set_post_part, only: [:show, :edit, :update, :destroy]

  # GET /post_parts
  # GET /post_parts.json
  def index
    @post_parts = PostPart.all
  end

  # GET /post_parts/1
  # GET /post_parts/1.json
  def show
  end

  # GET /post_parts/new
  def new
    @post_part = PostPart.new
  end

  # GET /post_parts/1/edit
  def edit
  end

  # POST /post_parts
  # POST /post_parts.json
  def create
    @post_part = PostPart.new(post_part_params)

    respond_to do |format|
      if @post_part.save
        format.html { redirect_to @post_part, notice: 'Post part was successfully created.' }
        format.json { render :show, status: :created, location: @post_part }
      else
        format.html { render :new }
        format.json { render json: @post_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_parts/1
  # PATCH/PUT /post_parts/1.json
  def update
    respond_to do |format|
      if @post_part.update(post_part_params)
        format.html { redirect_to @post_part, notice: 'Post part was successfully updated.' }
        format.json { render :show, status: :ok, location: @post_part }
      else
        format.html { render :edit }
        format.json { render json: @post_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_parts/1
  # DELETE /post_parts/1.json
  def destroy
    @post_part.destroy
    respond_to do |format|
      format.html { redirect_to post_parts_url, notice: 'Post part was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_part
      @post_part = PostPart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_part_params
      params.require(:post_part).permit(:heading, :body, :price, :neighborhood, :external_url, :timestamp)
    end
end
