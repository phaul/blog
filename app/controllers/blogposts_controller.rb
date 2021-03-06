# frozen_string_literal: true

class BlogpostsController < ApplicationController
  load_and_authorize_resource

  # GET /blogposts
  # GET /blogposts.json
  def index
    @blogposts = @blogposts.paginate(page: params[:page], per_page: 3)
  end

  # GET /blogposts/1
  # GET /blogposts/1.json
  def show; end

  # GET /blogposts/new
  def new
    @blogpost = Blogpost.new
    @blogpost.build_trip
  end

  # GET /blogposts/1/edit
  def edit
    @blogpost.build_trip unless @blogpost.trip
  end

  # POST /blogposts
  # POST /blogposts.json
  def create
    @blogpost = Blogpost.new(blogpost_params)

    respond_to do |format|
      if @blogpost.save
        format.html { redirect_to @blogpost, notice: 'Blogpost was successfully created.' }
        format.json { render :show, status: :created, location: @blogpost }
      else
        format.html { render :new }
        format.json { render json: @blogpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogposts/1
  # PATCH/PUT /blogposts/1.json
  def update
    respond_to do |format|
      if @blogpost.update(blogpost_params)
        format.html { redirect_to @blogpost, notice: 'Blogpost was successfully updated.' }
        format.json { render :show, status: :ok, location: @blogpost }
      else
        format.html { render :edit }
        format.json { render json: @blogpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogposts/1
  # DELETE /blogposts/1.json
  def destroy
    @blogpost.destroy
    respond_to do |format|
      format.html { redirect_to blogposts_url, notice: 'Blogpost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def blogpost_params
    locations_attributes = %i[latitude longitude label id _destroy]
    trip_attributes = [:id, { locations_attributes: locations_attributes }]
    image_attributes = %i[id file label _destroy]

    params.require(:blogpost).permit(:title,
                                     :date,
                                     :content,
                                     locations_attributes: locations_attributes,
                                     trip_attributes: trip_attributes,
                                     images_attributes: image_attributes)
  end
end
