class BooksController < ApplicationController
    def index
        @books = Book.all
        @book = Book.new
    end
    
    def show
        @book = Book.find(params[:id])
    end
    
    def edit
        @book = Book.find(params[:id])
    end
    
    def create
        @book = Book.new(book_params)
        if @book.save
            flash[:notice] = "Book was successfully created."
            redirect_to book_path(@book.id)
        else 
            flash.now[:alert] = "Error" # 応急的に
            redirect_to "/books"
        end
    end
    
    def update
        book = Book.find(params[:id])
        book.update(book_params)
        redirect_to book_path(book.id)
    end
    
    def destroy
        book = Book.find(params[:id])
        if book.destroy
            flash[:notice] = "Book was successfully destroyed."
            redirect_to "/books"
        else
            flash.now[:alert] = "Error Book was not destroy"
            redirect_to "/books"
        end
    end
    
    private
    # ストロングパラメータ
    def book_params
        params.require(:book).permit(:title, :text)
    end
end
