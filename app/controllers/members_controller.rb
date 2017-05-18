class MembersController < ApplicationController

  def index
    @members = Member.all
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    @member.save
    redirect_to root_path
  end

  private
    def member_params
      params.require(:member).permit(:name)
    end

end
