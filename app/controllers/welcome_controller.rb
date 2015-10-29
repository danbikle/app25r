require 'csv'
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

  def fb
    yresponse   = RestClient.get "http://real-chart.finance.yahoo.com/table.csv?s=FB"
    yresponse_s = yresponse.to_s
    @mycsv_a = CSV.parse(yresponse_s)
    render :json => @mycsv_a[1,9]
  end

  def fbcsv
    mycsv_s  = RestClient.get("http://real-chart.finance.yahoo.com/table.csv?s=FB").to_s
    @mycsv_a = CSV.parse(mycsv_s)
    response.headers['Content-Type'] = 'text/csv'
    response.headers['Content-Disposition'] = 'attachment; filename=fb.csv'    
    render :text => @mycsv_a[1,9]
  end

end
