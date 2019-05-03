class ComediansController < ApplicationController
  def go_home; redirect_to '/comedians' end

  def index
    if params[:query]
      if params[:queryType] == "name"
        comedians = Comedian.query_name(params[:query])
      elsif params[:queryType] == "age"
        comedians = Comedian.query_age(params[:query])
      end
    else
      comedians = Comedian
    end
    @total, @averageAge, @cities = comedians.prepare
    @comediansLeft = []; @comediansMid = []; @comediansRight = []; @specials = {}
    i = 0
    comedians.by_name.each do |x|
      @specials[x.name] = Special.get_by_id(x.id)
      case i
      when 0; @comediansLeft << x
      when 1; @comediansMid << x
      when 2; @comediansRight << x
      end
      i += 1; i = 0 if i > 2
    end
    @backgrounds = ['#c00', '#c60', '#c90', '#3c0', '#39f', '#969', '#606']
  end

  def new_comedian; end

  def create
    image_path = nil
    image_path = params[:creator][:image] if params[:creator][:image] != ""
    created = Comedian.new({name: params[:creator][:name], age: params[:creator][:age],
      home: params[:creator][:home], birthdate: params[:creator][:birthdate],
      birthplace: params[:creator][:birthplace], image_path: image_path})
    created.save
    redirect_to '/comedians'
  end

  def add_special
    @name = Comedian.find(params[:comedian]).name
    @id = Comedian.find(params[:comedian]).id
  end

  def new_special
    created = Special.new({comedian_id: params[:id], name: params[:creator][:name],
      runtime: params[:creator][:runtime], date: params[:creator][:date],
      location: params[:creator][:location]})
    created.save
    redirect_to '/comedians'
  end

  def delete
    comedian = Comedian.find_by(name: params[:name])
    Special.destroy_with_id(comedian.id)
    Comedian.destroy(comedian.id)
    redirect_to '/comedians'
  end
end
