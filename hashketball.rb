# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here
#Build a method, num_points_scored that takes in an argument of a player's name and returns the number of points scored for that player.
def num_points_scored(playerName)
  # will need to iterate/enumerate through player arrays (both home and away) and return the :points property value

  game_hash.values.each do |team|
    team[:players].each do |player|
      if player[:player_name] == playerName
        return player[:points]
      end
    end
  end
end


def shoe_size(playerName) 
  #return playerName's shoe size

  game_hash.values.each do |team|
    team[:players].each do |player|
      if player[:player_name] == playerName
        return player[:shoe]
      end
    end
  end
end

def team_colors(teamName) 
  #return arr of team colors
  if game_hash[:home][:team_name] == teamName
    return game_hash[:home][:colors]
  elsif game_hash[:away][:team_name] == teamName
    return game_hash[:away][:colors]
  end
end

def team_names()
  #return arr of team names
  [].push(game_hash[:home][:team_name], game_hash[:away][:team_name])
end

def player_numbers(teamName) 
  #return arr of jersey numbers for teamName
  jerseyNums = []

  if game_hash[:home][:team_name] == teamName
    game_hash[:home][:players].each do |player|
      jerseyNums.push(player[:number])
    end
  elsif game_hash[:away][:team_name] == teamName
    # return array of all jersey numbers of their players
    game_hash[:away][:players].each do |player|
      jerseyNums.push(player[:number])
    end
  end

  jerseyNums
end

def player_stats(playerName) 
  #return hash of player's stats
  stats = {}

  game_hash[:home][:players].select do |player|
    if player[:player_name] == playerName
      stats = player
    end
  end

  game_hash[:away][:players].select do |player|
    if player[:player_name] == playerName
      stats = player
    end
  end

  stats
end

def big_shoe_rebounds()
  #return num of rebounds for playerName that has largest shoe size
  #find player w larest shoe
  biggestShoe = 0
  bigFootPlayer = {}

  game_hash[:home][:players].each do |player|
    if player[:shoe] > biggestShoe
      biggestShoe = player[:shoe]
      bigFootPlayer = player
    end
  end

  game_hash[:away][:players].each do |player|
    if player[:shoe] > biggestShoe
      biggestShoe = player[:shoe]
      bigFootPlayer = player
    end
  end

  #return player's number of rebounds
  bigFootPlayer[:rebounds]
end