class BooksController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @book = Book.new
  end

  def index
    @book = Book.new
    @book = Book.all
  end
    
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "successfully create"
      redirect_to books_path
    else
      flash.now[:alert] = "create error"
      render :index
    end
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "successfully update"
      redirect_to books_path
    else
      flash.now[:alert] = "update error"
      render :index
    end
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to books_path  # 投稿一覧画面へリダイレクト
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:Title, :Body)
  end

end
