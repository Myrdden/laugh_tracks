class ComediansController < ApplicationController
  def index
    if params[:age]
      comedians = Comedian.all.where(:age => params[:age]).order(:name)
    else
      comedians = Comedian.all.order(:name)
    end
    i = 0
    @comediansLeft = []; @comediansMid = []; @comediansRight = []
    comedians.each do |x|
      case i
      when 0; @comediansLeft << x;
      when 1; @comediansMid << x;
      when 2; @comediansRight << x;
      end
      i += 1; i = 0 if i > 2
    end
    @backgrounds = ['#c00', '#c60', '#c90', '#cc0', '#cf0', '#39f', '#969', '#606']
  end
end
