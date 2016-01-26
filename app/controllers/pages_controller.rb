class PagesController < ApplicationController

  skip_before_filter :authenticate_user!

  def not_signed_in
  end

end
