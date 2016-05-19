class ProfilesController < ApplicationController
  load_and_authorize_resource
  
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
      respond_to do |format|
      if @profile.save
        format.html{ redirect_to @profile, notice: "Profile was successfully created."}
        format.json{ render :show, status: :created, location: @profile}
      else
        format.html{ render :new}
        format.json{ render json: @profile.errors, status: :unprocessile_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html{ redirect_to @profile, notice: "Profile was successfully updated."}
        format.json{ render :show, status: :ok, location: @profile}
      else
        format.html{ render :edit }
        format.json{render json: @profile.errors, status: :unprocessile_entity}
      end
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:full_name,:date_of_birth,:gender,:email,
        :mobile,:address,:time_to_become_member,:visa_type,:i20_expire_date,:house_leader,
        :group_leader,:self_description,:user_id, :nationality, :family_member, :emergency_contact_person,
        :created_at,:updated_at,:group_leader?,:house_leader?)
  end

end