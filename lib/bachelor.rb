require 'pry'
def get_first_name_of_season_winner(data, season)
  data[season].each do |person_data|
    if person_data["status"] == "Winner"
      return person_data["name"].split(" ")[0]
    end
  end
end

def get_contestant_name(data, occupation)
  data.each do |season, people|
    data[season].each do |person_data|
    if person_data["occupation"] == occupation
      return person_data["name"]
    end
  end
  end
end

def count_contestants_by_hometown(data, hometown)
  town_count = 0
  data.each do |season, people|
    data[season].each do |person_data|
      if person_data["hometown"] == hometown
        town_count += 1
      end
    end
  end
  town_count
end

def get_occupation(data, hometown)
  data.each do |season, people|
    data[season].each do |person_data|
      if person_data["hometown"] == hometown
        return person_data["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  age_array = []
  data[season].each do |person_data|
      age_array << person_data["age"].to_f
  end
  age_sum = 0
  people_count = age_array.size
  age_array.each { |a| age_sum += a}
  age_average = age_sum / people_count
  age_average.round
end
