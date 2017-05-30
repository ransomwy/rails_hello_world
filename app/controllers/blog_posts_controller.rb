class BlogPostsController < ApplicationController

# lists all blog posts
  def index
    #if view needs access you need an instance variable
    @blog_posts = BlogPost.all
    render :index
  end
#showing a single blog post
  def show
    @blog_post = BlogPost.find(params[:id])
  end
#showing the user a form to fill out
  def new
    @blog_post = BlogPost.new
  end

# responsible for creating a new blog post record
  def create

    @blog_post = BlogPost.new(blog_post_params)
    if @blog_post.save
      #got a new record inthe database
      redirect_to blog_post_path(@blog_post)
    else
      #something went wrong....have user fix errors
      render :new
    end
  end

  #shows user a form to edit an existing blog post
  def edit
    @blog_post = BlogPost.find(params[:id])
  end

#PUT/PATCH
#finding the record to update and updating it
  def update
    @blog_post = BlogPost.find(params[:id])
    if @blog_post.update(blog_post_params)
      redirect_to blog_post_path(@blog_post)
    else render :edit
  end
end

#delete
#Finds a record and removes it from the table
   def destroy
     @blog_post = BlogPost.find(params[:id])
     @blog_post.destroy
     redirect_to blog_posts_path
   end
   #strong params
   private
   def blog_post_params
    params.require(:blog_post).permit(:title, :author, :body)

   end
end
