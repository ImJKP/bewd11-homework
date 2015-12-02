class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
    render "index"
  end

  def edit
    @book = Book.find(params[:id])
    render "edit"
  end

  def create
    book = Book.new(book_params)
      if book.valid?
        book.save
        User.all.each do |user|
          UserMailer.new_book(user,book).deliver_now
        end
      redirect "/books"
    else
      flash[:error] = "Whoops, you're missing an author or title. Book not saved."
      redirect "/books"
    end
  end
  
  def update
    book = Book.find(params[:id])
    if book.valid?
      book.update_attributes(book_params)
      redirect_to "/"
    else
      flash[:error] = "Whoops, you're missing an author or title. Book not saved."
      redirect_to "/"
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.delete
    redirect "/books"
  end

private

  def book_params
    params.require(:book).permit(:title, :author, :cover, :release_date)
  end

end
