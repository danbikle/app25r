require 'csv'
class TkrsController < ApplicationController
  def data
    tkr      = params[:tkr]
    yrsp    = RestClient.get "http://real-chart.finance.yahoo.com/table.csv?s=#{tkr}"
    yrsp_s  = yrsp.to_s
    @mycsv_a = CSV.parse(yrsp_s)
    render :json => @mycsv_a[1,9]
  end
end
