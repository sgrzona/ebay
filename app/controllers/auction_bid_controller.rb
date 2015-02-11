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













end
