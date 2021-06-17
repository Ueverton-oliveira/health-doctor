class ApplicationController < ActionController::Base
  layout :layout_by_resource
  
  protected
  def layout_by_resource
    if devise_controller? && resource_class == Doctor
      "doctor_devise"
    elsif devise_controller? && resource_class == Patient
      "patient_devise"
    else
      "application"
    end
  end
end
