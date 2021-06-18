require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash.each do |season, holidays|
    if season == :summer
      holidays.each do |holiday|
        if holiday == :fourth_of_july
          return holiday[1]
        end
      end
    end
  end

  # i wasn't sure which way you wanted us to use so I did it both ways :)

  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  
  holiday_hash[:winter].each do |holiday, supplies|
    supplies << supply
  end
  return holiday_hash

  holiday_hash.each do |season, holidays|
    if season == :winter
      holidays.each do |holiday, supplies|
        supplies << supply
      end
    end
  end
  holiday_hash

end


def add_supply_to_memorial_day(holiday_hash, supply)

  holiday_hash.each do |season, holidays|
    if season == :spring
      holidays.each do |holiday, supplies|
        if holiday == :memorial_day
          supplies << supply
        end
      end
    end
  end
  return holiday_hash

  holiday_hash[:spring][:memorial_day] << supply

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash.each do |key, holidays|
    if key == season
      holiday_hash[key][holiday_name] = supply_array
    end
  end

end

def all_winter_holiday_supplies(holiday_hash)

  # return an array of all of the supplies that are used in the winter season
  holiday_hash.each do |season, holidays|
    if season == :winter
      return holidays.values.flatten
    end
  end

  holiday_hash[:winter].values.flatten

end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

  holiday_hash.each do |season, holidays|

    # converts symbol to string, removes ":" splits into an array removing the "_" char, capitalizes each word in the array,
    # then joins it back into a string before printing

    season = season.to_s.map {|word| word.capitalize!}.join(" ")
    puts "#{season}:"

    holidays.each do |holiday, items|

      holiday = holiday.to_s.split("_").map {|word| word.capitalize!}.join(" ")
      items = items.join(", ")
      puts "  #{holiday}: #{items}" 
    end
  end

end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  with_bbq = []

  #iterate through each season's hash
  holiday_hash.each do |season, holidays|
    #iterate the hash of holidays in this season
    holidays.each do |holiday, supplies|
      # check whether the supplies list of current holiday contains "BBQ". If it does, add the holiday to the array "with_bbq"
      if supplies.include?("BBQ")
        with_bbq << holiday
      end
    end
  end
  with_bbq
end







