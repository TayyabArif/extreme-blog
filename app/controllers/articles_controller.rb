class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end
    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end

    def create
        #render plain: params[:article].inspect
        @article=Article.new(params_data)
        if @article.save
            flash[:notice] = "Article created Successfuly"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    def show
        @article=Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])

        if @article.update(params_data)

            flash[:notice] = "Article is successfuly edited"
            redirect_to article_path(@article)
        else
            render 'edit'
        end

    end



    private

    def params_data
        params.require(:article).permit(:title, :description)
    end
end