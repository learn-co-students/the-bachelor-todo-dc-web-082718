def get_first_name_of_season_winner(data, season)
  real_ans = ""
  data.each do |which_season, array_info|
    if which_season == season 
      array_info.each do |element|
        element.each do |key, value|
          if value == "Winner"
            ans = element["name"]
            array = ans.split
            real_ans = array[0]
          end
        end
      end
    end
  end
  real_ans
end

def get_contestant_name(data, occupation)
  real_ans = ""
  data.each do |which_season, array_info|
    array_info.each do |element|
      element.each do |key, value|
        if value == occupation
          real_ans = element["name"]
        end
      end
    end
  end
  real_ans
end

def count_contestants_by_hometown(data, hometown)
  counter = 0
  data.each do |which_season, array_info|
    array_info.each do |element|
      element.each do |key, value|
        if value == hometown
          counter += 1
        end
      end
    end
  end
  counter
end

def get_occupation(data, hometown)
  real_ans = ""
  data.each do |which_season, array_info|
    array_info.each do |element|
      element.each do |key, value|
        if value == hometown
          return real_ans = element["occupation"]
        end
      end
    end
  end
end

def get_average_age_for_season(data, season)
  array_of_age = []
  sum = 0
  data.each do |which_season, array_info|
    if which_season == season
      array_info.each do |element|
        element.each do |key, value|
          if key == "age"
            array_of_age.push(value)
          end
        end
      end
    end
  end
  new_array = array_of_age.collect do |num|
    num.to_f
  end
  new_array.each do |num|
    sum += num
  end
  ans = sum / array_of_age.length
  ans.round
end
