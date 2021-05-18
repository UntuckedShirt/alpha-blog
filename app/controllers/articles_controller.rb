class ArticlesController < ApplicationController
  #this is a helper. You are passing in method name as a symbol to this method which is before_action
  #it performs this action for the actions needed
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def show 
    #must create an instance of article and not just a variable
     #@article = Article.find(params[:id])
  end

  def index
    @articles = Article.all

  end

  def new
    # initiate an @article instance variable in the new action
    #Otherwise, the code @article.errors.any? will fail (as there is no 
    #@article instance variable available at the time).
    @article = Article.new
  end
  #Add edit and update actions in the articles controller.
  def edit
    #@article = Article.find(params[:id])

  end

  def create
    #require top level key of article and permit title and desxription to create article instnce variable
    @article = Article.new(article_params)
    #render plain: @article.inspect
    if @article.save
      #helps render flash messages 
      flash[:notice] = "You did it! You created an article"
    redirect_to (@article)
    #In order to display the validation messages, we 
    #have to add an if else block to our create action. 
    #This is done to check for if the save happened, 
    #if not (else clause) then we display the new form 
    #again with the messages displayed.
    else
      render 'new'
    end
  end

  #Use the update action to find the article in the db. 
  #Whitelist the new title and description fields and 
  #if there are no validation errors, then update the 
  #article in the articles table with the new data
  def update
    #@article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "I can't believe you updated an article"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    #@article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
#Private makes code/method available for use just within the specific controller
  private

#this performs this line of code
  def set_article
    @article = Article.find(params[:id])
  end

#same as above it performs line for update/create
  def article_params
    params.require(:article).permit(:title, :description)
  end

end
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  # before_action :set_article, only: %i[ show edit update destroy ]

  # # GET /articles or /articles.json
  # def index
  #   @articles = Article.all
  # end

  # # GET /articles/1 or /articles/1.json
  # def show
  # end

  # # GET /articles/new
  # def new
  #   @article = Article.new
  # end

  # # GET /articles/1/edit
  # def edit
  # end

  # # POST /articles or /articles.json
  # def create
  #   @article = Article.new(article_params)

  #   respond_to do |format|
  #     if @article.save
  #       format.html { redirect_to @article, notice: "Article was successfully created." }
  #       format.json { render :show, status: :created, location: @article }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @article.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /articles/1 or /articles/1.json
  # def update
  #   respond_to do |format|
  #     if @article.update(article_params)
  #       format.html { redirect_to @article, notice: "Article was successfully updated." }
  #       format.json { render :show, status: :ok, location: @article }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @article.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /articles/1 or /articles/1.json
  # def destroy
  #   @article.destroy
  #   respond_to do |format|
  #     format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_article
  #     @article = Article.find(params[:id])
  #   end

  #   # Only allow a list of trusted parameters through.
  #   def article_params
  #     params.require(:article).permit(:title, :string, :description)
  #   end
#end
