module TimeCalculator
  module ApplicationHelper
    def add_css_file(file)
      raw "<style>#{raw File.read File.expand_path(File.dirname(__FILE__) + "/../../views/time_calculator/stylesheets/#{file}")}</style>"
    end

    def add_js_file(file)
      raw "<script>#{raw File.read File.expand_path(File.dirname(__FILE__) + "/../../views/time_calculator/javascripts/#{file}")}</script>"
    end
  end
end
