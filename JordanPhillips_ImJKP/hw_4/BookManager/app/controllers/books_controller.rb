class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
    render "index"
  end

  def edit
    render "edit"
  end

  def create
    Book.create(book_params)
    redirect "/books"
  end

private

  def book_params
    params.require(:book).permit(:title, :author, :cover, :release_date)
  end

end
