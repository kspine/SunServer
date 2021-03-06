# encoding: UTF-8
class AdminsController < ApplicationController

  before_filter :school_manager_or_self_required,        :only => [:show, :edit, :update, :change_password, :update_password]
  before_filter :school_management_permission_required,  :only => [:index, :new, :create, :destroy]

  def index
    if current_admin.is_global
      @admins = Admin.all
    else
      @admins = current_admin.school.admins
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admins }
    end
  end

  def show
    @admin = Admin.find_by_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin }
    end
  end

  def new
    @admin = Admin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin }
    end
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def create
    @admin = Admin.new(params[:admin])
    #@school = School.find_by_id(params[:school_id])
    @admin.encrypted_password = "$2a$10$sx/HYIizHHYKpph6wN1dOuAIPCE/deJv3SKVMirt2f8ETkuj4KRkC" # xiaoshu as default password
    respond_to do |format|
      if @admin.save
        format.html { redirect_to @admin, notice: '成功创建管理员' }
        format.json { render json: @admin, status: :created, location: @admin }
      else
        format.html { render action: "new" }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @admin = Admin.find(params[:id])

    respond_to do |format|
      if @admin.update_attributes(params[:admin])
        format.html { redirect_to @admin, notice: '信息已更新' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy

    respond_to do |format|
      format.html { redirect_to admins_url }
      format.json { head :ok }
    end
  end
  
  def change_password
    @admin = Admin.find(params[:id])
    render 'admins/passwords/edit'
  end
  
  def update_password
    @admin = User.find(current_admin.id)
    if @admin.update_attributes(params[:admin])
      # Sign in the user by passing validation in case his password changed
      sign_in @admin, :bypass => true
      redirect_to root_path
    else
      render "change_password"
    end
  end
  
    
  private # only for manager admin (global or of that school) or oneself
  def school_manager_or_self_required
    target_admin = Admin.find_by_id(params[:id])
    unless target_admin == current_admin or test_school_management_permission(target_admin)
      flash[:error] = "对不起，您没有权限进行此操作"
      redirect_to root_url
    end
  end
  
  private # only for global admin or admin of the current school
  def school_management_permission_required
    target_admin = Admin.find_by_id(params[:id])
    unless test_school_management_permission(target_admin)
      flash[:error] = "对不起，您没有权限进行此操作"
      redirect_to root_url
    end
  end
  
  private
  def test_school_management_permission(target_admin)
    current_admin.is_manager and (current_admin.is_global or target_admin.school == current_admin.school)
  end
  
end
