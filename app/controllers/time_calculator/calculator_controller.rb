module TimeCalculator
  class CalculatorController < ActionController::Base
    protect_from_forgery with: :null_session
    
    layout 'time_calculator/layouts/time_calculator'

    def show; end

    def create
      date = date_params[:date]

      if date
        @date_info = Calculator.new(date).time_to_next_date
      end
    end

    private

    def date_params
      params.require(:calculator).permit(:date)
    end
  end
end