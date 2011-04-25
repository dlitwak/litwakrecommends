class PostsController < ApplicationController

  before_filter :authenticate, :except => [:index, :show]

  # GET /posts
  # GET /posts.xml
  def index
    @posts = Post.all
    @title="All LitwakRecommends Posts"
	@metadescription = "Listing of all Posts for LitwakRecommends travel blog"
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
	@id = params[:id]
	@posts = Post.all
	if params[:id].to_i != @posts.length
		next_id = (params[:id].to_i + 1).to_s
	else
		next_id = params[:id]
	end
	if params[:id].to_i != 1
		prev_id = (params[:id].to_i - 1).to_s
	else
		prev_id = params[:id]
	end
	
	@title=Post.find(params[:id]).title
	@metadescription = Post.find(params[:id]).title
	
	@previous_post = Post.find(prev_id)
    @post = Post.find(params[:id])
	@next_post = Post.find(next_id)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new
	@posts = Post.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
	@posts = Post.all
  end

  # POST /posts
  # POST /posts.xml
  def create
	@posts = Post.all
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])
	@posts = Post.all
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
  
  def summarize
	@post = Post.find(params[:id])
	@summary = truncate(@post.content, 200, ". . .")
  end
  
  def rss
	@posts = Post.fine(:all, :order => "id DESC", :limit => 10)
	render :layout => false
	response.headers["Content-Type"] = "application/xml; charset=utf"
	end
end
