class PostsController < ApplicationController
 
  def index

    if session[:user_id] != nil 
      # get all topics from user's group
      ## currently you can only add posts to groups via the console
      @usergroups = User.find(session[:user_id]).group
      #@current_user_group_id = User.find(session[:user_id]).group_

      #puts "current_user_group_id"
      #puts @current_user_group_id 
      puts "is logged in " + @usergroups.to_s
      @posts = Post.where(group_id: @usergroups) #.groups & @current_user_group_id
    else
      puts "isnt logged in "
      @posts = Post.all 
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    
    if @post.save
      puts "POST SAVE"
      redirect_to(posts_path)
    else
      puts "FAIL CREATING POST"
      render('new')
    end  

  end  

  def edit
  end

  def delete
  end

  private

  def post_params
    params.require(:post).permit(:title, :avatar)
  end  

end
