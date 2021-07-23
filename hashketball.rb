# Write your code below game_hash
require 'pry'

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
def num_points_scored(player_name)
  # need a helper method that will return a player's stats
  player = player_stats(player_name)
  player[:points]
end

def player_stats(player_name)
  # this method returns a specific player's stats
  # need a helper method that will return all players's stats
  all_players.find do |player|
    player[:player_name] == player_name
  end
end

def all_players
  # this method returns all players's stats
  game_hash[:home][:players] + game_hash[:away][:players]
end

def shoe_size(player_name)
  player = player_stats(player_name)
  player[:shoe]
end

def team_colors(team_name)
  # need a helper method that will find the team in question
  team = find_team(team_name)
  team[:colors]
end

def find_team(team_name)  
  team_info = game_hash.find do |location, team_data| # iterate over each location key in game_hash
    # and returns a key-value pair that satisfies the predicate function defined in the body of .find method
    team_data[:team_name] == team_name
  end
  # team_info returns an array that consists of a key on index 0, and its value on index 1.
  # in this case, the key would be either :home or :away
  # and the value would be the hash that :home or :away points to
  team_info[1]
end

def team_names
  game_hash.map do |location, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team_name)
  team = find_team(team_name)
  team[:players].map do |player|
    player[:number]
  end
end

def big_shoe_rebounds
  # need a helper method to find the player with the biggest shoe
  big_shoe_player[:rebounds]
end

def big_shoe_player
  # check out more methods on enumerables at
  # https://ruby-doc.org/core-3.0.1/Enumerable.html#method-i-max_by
  all_players.max_by do |player|
    player[:shoe]
  end
end