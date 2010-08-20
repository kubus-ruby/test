class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.xml
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = Comment.find(params[:id])
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new
    respond_to do |format|
      format.html
      format.js { render :partial => '/comments/new' }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.xml
  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(params[:comment])
    respond_to do |format|
      if @comment.save
        format.html { redirect_to(product_path(@comment.product), :notice => 'Comment was successfully created.')}
        format.js
      else
        format.html { render :action => "new" }
        format.js
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(@comment, :notice => 'Comment was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(comments_url) }
      format.xml { head :ok }
    end
  end
end
