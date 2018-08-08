require "pry"

def get_first_name_of_season_winner(data, season)
  contestantStatuses = []

  season = data.fetch(season)
  season.each do |personalHash, pairs|
    personalHash.each do |key, value|
      if key == "status"
        contestantStatuses << value

      end
    end
  end
  winnerIndex = contestantStatuses.index("Winner")

  winnerName = []

  winnerHash = season[winnerIndex]
  winnerHash.each do |question, answer|
    if question == "name"
      winnerName << answer
    end
  end

  winnerName = winnerName.join(" ").split(" ")
  winnerName = winnerName[0]
  winnerName
end


def get_contestant_name(data, occupation)
  contestantHash = {}

  data.each do |season, contestants|
    contestants.each do |personalHash, pairs|
      personalHash.each do |question, answer|
        if question == "occupation"
          if answer == occupation
            contestantHash = personalHash
          end
        end
      end
    end
  end
  contestantHash["name"]
end


def count_contestants_by_hometown(data, hometown)
  fromHomeTown = []

  data.each do |season, contestants|
    contestants.each do |personalHash, pairs|
      personalHash.each do |question, answer|
        if question == "hometown"
          if answer == hometown
            fromHomeTown << hometown
          end
        end
      end
    end
  end
  fromHomeTown.length
end



def get_occupation(data, hometown)
  fromHomeTown = []

  data.each do |season, contestants|
    contestants.each do |personalHash, pairs|
      personalHash.each do |question, answer|
        if question == "hometown"
          if answer == hometown
            fromHomeTown << personalHash["occupation"]
          end
        end
      end
    end
  end
  fromHomeTown[0]
end

def get_average_age_for_season(data, season)
  ages = []

  season = data.fetch(season)
  season.each do |personalHash, pairs|
    personalHash.each do |key, value|
      if key == "age"
        ages << value
      end
    end
  end
  ages
  numAges = []

  i = 0
  while i < ages.length
    numAges << ages[i].to_f
    i += 1
  end
  sum = 0
  i = 0

  while i < numAges.length
    sum += numAges[i]
    i += 1
  end
  sum = sum / numAges.length
  sum.round
end
