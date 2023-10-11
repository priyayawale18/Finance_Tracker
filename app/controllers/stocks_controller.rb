  class StocksController < ApplicationController
  	def search
      if params[:stock].present?
        @stock = Stock.new_lookup(params[:stock])
        if @stock
          respond_to do |format|
            format.js { render partial: ''}
            format.html # This line is correct; it renders the default HTML view.
            format.json { render json: @stock } # You can also respond with JSON if needed.
          end
        else
          flash[:alert] = "Invalid symbol. Please enter a valid symbol to search."
          redirect_to my_portfolio_path
        end
      else
        flash[:alert] = "Please enter a symbol to search."
        redirect_to my_portfolio_path
      end
    end
  end

