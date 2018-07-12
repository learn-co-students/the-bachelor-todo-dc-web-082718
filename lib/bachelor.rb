require 'pry'

def get_first_name_of_season_winner(data, season)
  h_contestant = data[season].select { |hash|
    hash.values.include? "Winner"
  }

  h_contestant[0]["name"].split(' ').first
end

def get_contestant_name(data, occupation)

  data.each { |season, a_ctst|
    # binding.pry
    h_contestant = a_ctst.keep_if { |hash|
      hash.values.include? occupation
    }
    if !h_contestant.empty? then return h_contestant[0]["name"] end
  }

end

def count_contestants_by_hometown(data, hometown)
count = 0

  data.each { |season, a_ctst|
  count += a_ctst.collect { |hash|
      hash.values.include? hometown
    }.count(true)
  }

count
end

def get_occupation(data, hometown)
  data.each { |season, a_ctst|
    a_ctst.each { |hash|
      if hash.values.include? hometown then return hash["occupation"] end
    }
  }
end

def get_average_age_for_season(data, season)
  ages = data[season].collect { |hash|
    hash["age"].to_i
  }

(ages.inject{ |sum, age| sum + age }/ages.length.to_f).round
end
