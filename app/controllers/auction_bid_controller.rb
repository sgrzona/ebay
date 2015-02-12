class AuctionBidController < ApplicationController
  before_action :require_login, only: [:create]

  def index
  	@auction =Auction.find(params[:auction_id])
  	@bids = @auction.bids
  end

  def new
  	@auction = Auction.find(params[:auction_id])
    @bid = Bid.new
  end

  def show
  	@bid = Bid.find(params[:id])
  end

  def create
  	@auction = Auction.find(params[:auction_id])
  	@bid = Bid.new(bid_params)
  	@bid.bidder = current_user
  	@bid.auction = @auction
  	if not_users_own_auction?
  		if @bid.save
  			redirect_to @auction, :notice => "You are the current high bidder"
  		else
  			flash[:error] = @bid.errors.full_messages
  			render :new
  		end
  	else
  		flash[:error] = "You cannot bid on your won auction."
      redirect_to @auctions
  	end
  end

  private

  def bid_params
  	params.require(:bid).permit(:amount)
  end

  def not_users_own_auction?
  	@bid.auction.seller != current_user
  end
end
