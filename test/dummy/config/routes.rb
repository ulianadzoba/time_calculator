Rails.application.routes.draw do
  mount TimeCalculator::Engine => "/time_calculator"
end
