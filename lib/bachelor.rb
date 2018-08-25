require 'pry'

def get_first_name_of_season_winner(data, season)
  # code here
  #winner = nil
  #data.each do |hash_season, contestants_array|
  #  if hash_season == season
  #    contestants_array.each do |contestant|
  #      if contestant["status"] == "Winner"
  #        winner = contestant["name"].split
  #        winner = winner[0]
  #      end
  #    end
  #  end
  #end
  #winner

  #data[season].find{|contestant| contestant["status"] == "Winner"}["name"].split.first


  data[season].each do |contestant|
    if contestant["status"] == "Winner"
      return contestant["name"].split(" ")[0]
    end
  end

  
end

def get_contestant_name(data, occupation)
  # code here
  person = nil
  data.each do |hash_season, contestants_array|
    contestants_array.find do |contestant|
      if contestant["occupation"] == occupation
        person = contestant["name"]
      end
    end
  end
  person

  #contestant = get_contestants(data).find { |contestant| contestant["occupation"] == occupation }
  #contestant["name"]
end

def count_contestants_by_hometown(data, hometown)
  # code here
  person = []
  data.each do |hash_season, contestants_array|
    contestants_array.each do |contestant|
      if contestant["hometown"] == hometown
        person << hash_season
      end
    end
  end
  person.length

# data.each do |hash_season, contestants_array|
#    contestants_array.each do |contestant|
#    if contestant["hometown"] == hometown
#        hometown_count +=1
#     end
#   end
# end
#hometown_count

end

def get_occupation(data, hometown)
  # code here	  # code here
  data.each do |season, array|
    array.each do |hash|
      hash.each do |k,v|
        if v == hometown
          return hash["occupation"]
        end
      end
    end
  end
 end	

def get_average_age_for_season(data, season)
  # code here

  contestant_ages = data[season].collect do |contestant|
    contestant["age"].to_i
  end

  summed_ages = contestant_ages.reduce(0) {|sum, age| sum += age}
  contestant_count =  contestant_ages.count.to_f
  (summed_ages/contestant_count).round

end