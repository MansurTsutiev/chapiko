class BlocksController < ApplicationController
  def index
    @blocks = Block.all
  end 

  def new
    @block = Block.new
    render :new
  end

  def create
    @block = Block.create!(blocks_params)
  end

  private

  def blocks_params
    params.require(:block).permit(:link)
  end
end