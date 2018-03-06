class ArtworksController < ApplicationController

  def index
    render json: Artwork.all
  end

  def create
    art = Artwork.new(art_params)
    if art.save
      render json: art
    else
      render json: art.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    result = Artwork.find_by(:id => params[:id])
    unless result.nil?
      render json: result
    else
      render plain: "No such artwork #{params[:id]}", status: 404
    end
  end

  def destroy
    result = Artwork.find_by(:id => params[:id])
    unless result.nil?
      result.destroy
      render plain: "Artwork #{params[:id]} destroy"
    else
      render plain: "No such artwork #{params[:id]}", status: 404
    end
  end

  def update
    result = Artwork.find_by(:id => params[:id])
    unless result.nil?
      result.update(art_params)
      render json: result
    else
      render plain: "No such artwork #{params[:id]}", status: 404
    end
  end

  private

  def art_params
    params.require(:art).permit(:title, :image_url, :artist_id)
  end
end
