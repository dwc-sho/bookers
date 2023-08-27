class BooksController < ApplicationController
    def index
        @books = Book.all
        @book = Book.new
    end
    
    def show
        @book = Book.find(params[:id])
    end
    
    def create
        @book = Book.new(book_params)
        if @book.save
            flash[:notice] = "Book was successfully created."
            redirect_to book_path(@book.id)
        else 
            flash.now[:alert] = "Error" # 応急的に
            render :index
        end
    end
    
    private
    # ストロングパラメータ
    def book_params
        params.require(:book).permit(:title, :text)
    end
end
