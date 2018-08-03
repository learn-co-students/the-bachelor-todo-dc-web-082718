require 'pry'


def get_first_name_of_season_winner(data, season)
  data[season].each do |person_data|
    if person_data["status"] == "Winner"
      return person_data["name"].split(" ")[0]
    end
  end
end

def get_contestant_name(data, occupation)
  data.each do |season_name, season_data|
    season_data.each do |person|
      if person["occupation"] == occupation
        return person["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  count_matches = 0
  data.each do |season_name, season_data|
    season_data.each do |person|
      if person["hometown"] == hometown
        count_matches += 1
      end
    end
  end
  return count_matches
end

def get_occupation(data, hometown)
  data.each do |season_name, season_data|
    season_data.each do |person|
      if person["hometown"] == hometown
        return person["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  all_ages = []
  data[season].each do |person_data|
    all_ages << person_data["age"].to_f
  end
  avg_age = 0
  people_count = 0
  all_ages.each do |num|
    avg_age += num
    people_count += 1
  end
  return (avg_age / people_count).round
end
