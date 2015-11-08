class StoresController < ApplicationController

  def index
    book = Book.find(params[:book_id])
    @stores = book.store.all
    @store = book.store.new
    render "index"
  end

  def create
    Book.find(params[:book_id]).store.create(store_params)
    redirect_to book_stores_path
  end

  def edit
  end

  def show
  end

  def update
  end
  
  def destroy
    store = Store.find(params[:id])
    store.delete
    redirect_to "/stores"
  end
  
  
private
  def store_params
    params.require(:store).permit(:name, :address, :book_id)
  end
  
end
