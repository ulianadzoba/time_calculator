require 'time'
require 'date'
require 'ostruct'
require 'active_support/all'

module TimeCalculator
  mattr_accessor :mount_at
  @@mount_at = "/time_calculator"
  
  class Calculator
    def initialize(date)
      @date = date
    end
  
    def time_to_next_date
      birthday_date =
        if @date.is_a?(DateTime)
          @date
        else
          DateTime.parse(@date)
        end
  
      current_date = DateTime.now
      
      current_birthday = modify_date(current_date.year,
                                     birthday_date.month,
                                     birthday_date.day,
                                     birthday_date.hour,
                                     birthday_date.min,
                                     birthday_date.sec)
      
      time_left = 
        if current_birthday - current_date >= 0
          current_birthday.utc - current_date.utc - Time.now.utc_offset
        else 
          modify_date(current_date.year + 1,
                      current_birthday.month,
                      current_birthday.day,
                      current_birthday.hour,
                      current_birthday.min,
                      current_birthday.sec).utc - current_date.utc - Time.now.utc_offset
        end
  
      mm, ss = time_left.divmod(60)
      hh, mm = mm.divmod(60)         
      dd, hh = hh.divmod(24)
  
      OpenStruct.new(days: dd, hours: hh, minutes: mm)
    end
  
    def modify_date(year, month, day, hour, min, sec) 
      begin
        DateTime.new(year, month, day, hour, min, sec)
      rescue ArgumentError
        for i in 1..4
          begin 
            return DateTime.new(year + i, month, day, hour, min, sec)
          rescue ArgumentError
            next
          end
        end
      end
    end
  end
end

require 'time_calculator/engine'