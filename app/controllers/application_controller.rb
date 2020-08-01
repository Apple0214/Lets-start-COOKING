class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name_kanji_sei, :name_kanji_mei, :name_kana_sei, :name_kana_mei, :poatal_code, :street_address, :phone_number, :is_active])
	end
end