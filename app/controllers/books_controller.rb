class BooksController < ApplicationController
    def index
        @book = Book.new
    end
    
    def create
        @book = Book.new(list_params)
        if @book.save
            flash[:notice] = "Book was successfully created."
            redirect_to "/" # 応急的に
        else 
            flash.now[:alert] = "Error" # 応急的に
            render :index
        end
    end
    
    private
    # ストロングパラメータ
    def list_params
        params.require(:book).permit(:title, :text)
    end
end
