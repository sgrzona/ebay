class AuctionBidsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :edit, :update, :create, :destroy]

  def my
    @auction_bid = current_user.auction_bids.order("bid desc")
  end

  def index
  	@auction = Auction.find(params[:auction_id])
    @auction_bids = @auction.auction_bids.order("bid desc")
  end

  def new
  	@auction = Auction.find(params[:auction_id])
    @auction_bid = AuctionBid.new
  end

  def show
  	@auction_bid = AuctionBid.find(params[:id])
    @auction = @auction_bid.auction
  end

  def create
    @auction = Auction.find(params[:auction_id])
    @auction_bid = @auction.auction_bids.new(auction_bid_params)
    @auction_bid.user = current_user

    Rails.logger.info "\n\n*** #{@auction_bid.inspect}\n"

    if not_users_own_auction?
      if @auction_bid.save
        redirect_to @auction, :notice => "You are the current high bidder"
      else
        render :new
      end
    else
      flash[:error] = "You cannot bid on your own auction."
      redirect_to @auction
    end
  end

  private

  def auction_bid_params
  	params.require(:auction_bid).permit(:bid)
  end

  def not_users_own_auction?
  	@auction_bid.auction.user != current_user
  end
end
