class ComediansController < ApplicationController
  def index
    if params[:query]
      if params[:queryType] == "name"
        comedians = Comedian.all.where(:name => params[:query]).order(:name)
      elsif params[:queryType] == "age"
        comedians = Comedian.all.where(:age => params[:query]).order(:name)
      end
    else
      comedians = Comedian.all.order(:name)
    end
    i = 0
    @total = Comedian.all.count
    @averageAge = comedians.average(:age)
    @cities = comedians.pluck(:home).uniq
    @comediansLeft = []; @comediansMid = []; @comediansRight = []; @specials = {}
    comedians.each do |x|
      @specials[x.name] = Special.all.where(:comedian => x.name)
      case i
      when 0; @comediansLeft << x
      when 1; @comediansMid << x
      when 2; @comediansRight << x
      end
      i += 1; i = 0 if i > 2
    end
    @backgrounds = ['#c00', '#c60', '#c90', '#cc0', '#cf0', '#39f', '#969', '#606']
  end

  def create

  end
end
