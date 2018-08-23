def get_first_name_of_season_winner(data, season)
  # code here
  name = ""

  data.each do |key, info|
    if key == season
      info.each do |hash|
        hash.each do |attribute, value|
          if attribute == "status" && value == "Winner"
            puts attribute
            puts value
            puts hash["name"]
            name = hash["name"]
            return name.split(' ').first

          end
        end
      end
    end
  end
end

def get_contestant_name(data, occupation)
  # code here
  data.each do |key, info|
      info.each do |hash|
        hash.each do |attribute, value|
          if attribute == "occupation" && value == occupation
            return hash["name"]
          end
        end
      end
  end

end

def count_contestants_by_hometown(data, hometown)
  # code here
  counter = 0;

  data.each do |key, info|
      info.each do |hash|
        hash.each do |attribute, value|
          if attribute == "hometown" && value == hometown
            counter += 1
          end
        end
      end
  end
  counter
end

def get_occupation(data, hometown)
  # code here
  data.each do |key, info|
      info.each do |hash|
        hash.each do |attribute, value|
          if attribute == "hometown" && value == hometown
            return hash["occupation"]
          end
        end
      end
  end
end

def get_average_age_for_season(data, season)
  # code here
  total_age = 0
  total_contestants = 0


  data.each do |key, info|
    if key == season
      info.each do |hash|
        hash.each do |attribute, value|
          if attribute == "age"
            total_age += hash[attribute].to_f
            total_contestants += 1
          end
        end
      end
    end
  end

    avg_age = (total_age / total_contestants).round
end
