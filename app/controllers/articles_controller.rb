class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index,:search,:show]
  def index
    @articles = Article.order('updated_at DESC').limit(5)
  end

  def search
    @prefs = Prefecture.all
		@articles = Article.where('area LIKE(?)', "%#{params[:area]}%").order('updated_at DESC').page(params[:page]).per(10)
    @articles = @articles.where('genre LIKE(?)', "%#{params[:genre]}%").order('updated_at DESC').page(params[:page]).per(10)
		@articles = @articles.where('date LIKE(?)', "%#{params[:date]}%").order('updated_at DESC').page(params[:page]).per(10)
    @articles = @articles.where('detail LIKE(?)', "%#{params[:detail]}%").order('updated_at DESC').page(params[:page]).per(10)
  end

  def show
    @article = Article.find(params[:id])
    @message = Message.new
  end

  def new
    @prefs = Prefecture.all
    @article = Article.new  
  end

  def create 
    @article = Article.new(article_params)
    if @article.save
       @article.save
    else
			@prefs = Prefecture.all
    	render :new
    end
  end

  def edit
    @prefs = Prefecture.all
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    
		article.title  = article_params[:title]
		article.area   = article_params[:area]
		article.place  = article_params[:place]
		article.genre  = article_params[:genre]
		article.norma  = article_params[:norma]
		article.detail = article_params[:detail]

    if article.save
      article.update(article_params)
    else
      @prefs = Prefecture.all
    	@article = article
      render :new
    end
  end

  def destroy
    article = Article.find(params[:id])
    if article.user_id == current_user.id
      article.destroy
    end
  end

  private
  def article_params
    params.require(:article).permit(:title,:date,:area,:place,:genre,:norma,:detail).merge(user_id: current_user.id)
  end

end
