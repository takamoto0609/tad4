class FieldsController < ApplicationController
  def new
    if user_signed_in?
      @field = Field.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    field = Field.new(field_params)
    if field.valid?
      if Field.find_by(user_id: current_user.id) != nil
        Field.find_by(user_id: current_user.id).destroy
      end
      Field.create(field_params)
      redirect_to :root
    else
      @field = Field.new(field_params)
      render :new
    end
  end

  private

  def field_params
    params.require(:field).permit(:address, :user_id, :latitude, :longitude).merge(user_id: current_user.id)
  end
end
