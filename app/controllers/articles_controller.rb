class ArticlesController < ApplicationController
    def new
        @article = Article.new() # creates articles before passing to new.html.erb
    end
    def edit
        @article = Article.find(params[:id])
    end
 
    def update
        @article = Article.find( params[:id])

        if  @article.update(article_params)
            redirect_to @article
        else 
            render 'edit'
        end
    end

    def create
        @article = Article.new(article_params) 
        # params[:article] returns the actioncontroller paramaters object
        if @article.save
            redirect_to @article #if doesnt meet condition
        else 
            render 'new' #use this instead of redirect to pass @article back to the new article view
        end
    end
    def index
        @articles = Article.all
    end
    def show
        @article = Article.find(params[:id])

    end



    private
        def article_params
            params.require(:article).permit(:title, :text)
        end
    
 
end