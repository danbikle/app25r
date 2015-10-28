class WelcomeController < ApplicationController
  def index
  end

  def somejson
    render :json => "['hello json', {'key': 'value', 'k': 'v', 'imakey2': 'Dan'}]"
  end

  def morejson
    @myjson = <<-EOF
      [
        'hello json', 
        {
          'key': 'value', 
          'k': 'v', 
          'imakey2': 'Dan'
        }
      ]
    EOF
    render :json => @myjson
  end

  def carjson
    @cars = Car.all
    render :json => @cars
  end
  def cars
    @cars = Car.all
  end
end
