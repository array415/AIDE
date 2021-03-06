module SessionsHelper

  def login(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    if current_user == nil
      redirect_to ('/')
    end
  end

  def logout
    @current_user = session[:user_id] = nil
  end

  def patient
   Patient.find_by_user_id(current_user.id)
  end

  def caregiver
   Caregiver.find_by_user_id(current_user.id)
  end
  
  def find_patient_and_redirect
    @patient = Patient.find_by_user_id(@user.id)
    flash[:notice] = "Successfully logged in!"
    redirect_to patient_path(@patient)
  end

  def find_caregiver_and_redirect
    @caregiver = Caregiver.find_by_user_id(@user.id)
    flash[:notice] = "Successfully logged in!"
    redirect_to caregiver_path(@caregiver)
  end

end
