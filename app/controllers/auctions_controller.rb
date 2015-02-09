class AuctionsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :edit, :update, :create, :destroy, :my]
  before_action :set_auction, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy ]
  
  # GET /auctions
  def index
    @auctions = Auction
  end

  def my
    @auctions = current_user.auctions.order("expires_at asc")
  end

   # GET /auctions/1
  def show
  end

  # GET /auctions/new
  def new
    @auction = current_user.auctions.build
  end

  # GET /auctions/1/edit
  def edit
  end

  # POST /auctions
  def create  
    @auction = current_user.auctions.build(auction_params)
    if @auction.save
      redirect_to @auction, notice: 'Auction was successfully created.' 
    else
      render action: "new"
    end
  end

  def update
    if @auction.update(auction_params)
      redirect_to @auction, notice: 'Auction was successfully updated.' 
    else
      render action: 'edit'
    end

  end

  # DELETE /auctions/1
  def destroy
    if @auction.destroy
      redirect_to auctions_url, notice: 'Auction was successfully destroyed.' 
    else
      redirect_to auctions_url, error: 'Auction could not be destroyed.'
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auction
      @auction = Auction.find(params[:id])
    end

    def correct_user
      if @auction.user_id != current_user.id
        redirect_to auctions_path, error: "Not authorized to edit this auction" 
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auction_params
      params.require(:auction).permit(:title, :description, :user_id, :image, :expires_at)
    end
end
