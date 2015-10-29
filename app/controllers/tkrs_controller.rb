require 'open-uri'
require 'csv'
class TkrsController < ApplicationController
  def data
    tkr      = params[:tkr]
    mycsv_s  = open("http://real-chart.finance.yahoo.com/table.csv?s=#{tkr}") {|f| f.read }
    @mycsv_a = CSV.parse(mycsv_s)
    render :json => @mycsv_a[1,9]
  end
end
