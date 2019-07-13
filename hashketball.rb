# Write your code here!
require 'pry'

def game_hash
  game_stats = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
        colors: ["Turquoise", "Purple"],
        players: {
          "Jeff Adrien" => {
            number: 4,
            shoe: 18,
            points: 10,
            rebounds: 1,
            assists: 1,
            steals: 2,
            blocks: 7,
            slam_dunks: 2
          },
          "Bismack Biyombo" => {
            number: 0,
            shoe: 16,
            points: 12,
            rebounds: 4,
            assists: 7,
            steals: 7,
            blocks: 15,
            slam_dunks: 10
          },
          "DeSagna Diop" => {
            number: 2,
            shoe: 14,
            points: 24,
            rebounds: 12,
            assists: 12,
            steals: 4,
            blocks: 5,
            slam_dunks: 5
          },
          "Ben Gordon" => {
            number: 8,
            shoe: 15,
            points: 33,
            rebounds: 3,
            assists: 2,
            steals: 1,
            blocks: 1,
            slam_dunks: 0
          },
          "Brendan Haywood" => {
            number: 33,
            shoe: 15,
            points: 6,
            rebounds: 12,
            assists: 12,
            steals: 22,
            blocks: 5,
            slam_dunks: 12
          }
        }
      }
    }

  game_stats
end

def get_team_data(team, hash, attribute)
  hash.each do |location, team_data|
    if team_data[attribute] == team
      team_data[attribute]
    end
  end
end

##returns a list for all the numbers in a team
def get_team_list(team_name, attribute)
  total_numbers = []
  game_hash.each do |location, team_data|
    if team_data.is_a?(Hash)
      ##We enter 2nd layer
      if team_data[:team_name] == team_name
        team_data.each do |second_layer_data, attributes|
          if attributes.is_a?(Hash)
          ##3rd layer, we should be accessing player list at this point
            attributes.each do |player_name, player_data|
              total_numbers.push(player_data[attribute])
            end
          end
        end
      end
    end
  end
  #binding.pry
  return total_numbers
end

def get_player_attribute(player, attribute)
  #good_practices
  found_attribute = ''
  game_hash.each do |location, team_data|
    if team_data.is_a?(Hash)
      ##We enter 2nd layer
      team_data.each do |second_layer_data, attributes|
        if attributes.is_a?(Hash)
          ##3rd layer, we should be accessing player list at this point
          attributes.each do |player_name, player_data|
            if player == player_name
              found_attribute = player_data[attribute]
              #binding.pry
            end
          end
        end
      end
    end
  end
  #binding.pry
  return found_attribute
end


def num_points_scored(player)
  get_player_attribute(player, :points)
end

def shoe_size(player)
  get_player_attribute(player, :shoe)
end

def team_colors(searched_team)
  team_colors = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == searched_team
      team_colors = team_data[:colors]
    end
  end
  team_colors
end

def team_names
  total_teams = []
  game_hash.each do |location, team_data|
    total_teams.push(team_data[:team_name])
  end
  total_teams
end

def player_numbers(team_name)
  get_team_list(team_name, :number)
end

def player_stats(player)
  found_data = ''
  game_hash.each do |location, team_data|
    if team_data.is_a?(Hash)
      ##We enter 2nd layer
      team_data.each do |second_layer_data, attributes|
        if attributes.is_a?(Hash)
          ##3rd layer, we should be accessing player list at this point
          attributes.each do |player_name, player_data|
            if player == player_name
              #binding.pry
              found_data = player_data
              #binding.pry
            end
          end
        end
      end
    end
  end
  #binding.pry
  return found_data
end

def big_shoe_rebounds
  max_shoe = 0
  current_max_player = ''
  game_hash.each do |location, team_data|
    if team_data.is_a?(Hash)
      ##We enter 2nd layer
      team_data.each do |second_layer_data, attributes|
        if attributes.is_a?(Hash)
          ##3rd layer, we should be accessing player list at this point
          attributes.each do |player_name, player_data|
            #binding.pry
            if player_data[:shoe] > max_shoe
              max_shoe = player_data[:shoe]
              current_max_player = player_name
            end
          end
        end
      end
    end
  end
  max_shoe_size = get_player_attribute(current_max_player, :rebounds)
  max_shoe_size
end
