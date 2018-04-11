class GroupsController < ApplicationController
  
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])

  end

  def new
    @post = Post.new
    @group = Group.new

  end

  def create
    @group = Group.new(post_params)
    
    if @group.save
      puts "POST SAVE"
      redirect_to(groups_path)
    else
      puts "FAIL CREATING POST"
      render('new')
    end  

  end  

  def new_post
    @post = Post.new
    Post.group = @group
  end  

  def create
    @group = Group.new(group_params)

    if(session[:user_id] != nil)
      @group.user_id = session[:user_id]
    end

    if @group.save
      puts "GROUP SAVE"
      redirect_to(groups_path)
    else
      puts "FAIL CREATING GROUP"
      render('new')
    end  
  end  

  def edit

  end

  def delete
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to(groups_path)
  end

  private

  def group_params
    params.require(:group).permit(:name, :avatar)
  end  

end
