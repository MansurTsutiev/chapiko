class BlocksController < ApplicationController
  def index
    @blocks = Block.all
  end 

  def new
    @block = Block.new
  end

  def create
    Block.create(blocks_params)
    redirect_to action: "index"
  end

  private

  def blocks_params
    params.require(:block).permit(:link)
  end
end