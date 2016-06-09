class ProfilesController < ApplicationController
  layout "landing"
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
        UserMailer.welcome_email(@profile).deliver_later
        format.html{ redirect_to root_path, notice: "Profile was successfully created."}
        format.json{ render :show, status: :created, location: @profile}
      else
        format.html{ render :new }

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
        :created_at,:updated_at,:group_leader?,:house_leader?, :pastor?, :home_town, :image,
        :home_town_contact_person,:home_town_contact_person_phone,:marital_status, :remove_image)
  end

end