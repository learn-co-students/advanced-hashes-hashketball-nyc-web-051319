require "pry"
# Write your code here!
def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(name)
  array = []
  hash = game_hash
  hash.each do |location, data|
    data.each do |key, value|
      if key == :players
        value.each do |player, data|
          data.each do |title, stat|
            if player == name && title == :points
              array.push(stat)
            end
          end
        end
      end
    end
  end
  array[0]
end

def shoe_size(name)
  array = []
  hash = game_hash
  hash.each do |location, data|
    data.each do |key, value|
      if key == :players
        value.each do |player, data|
          data.each do |title, stat|
            if player == name && title == :shoe
              array.push(stat)
            end
          end
        end
      end
    end
  end
  array[0]
end

def team_colors(team_name)
  if team_name == "Brooklyn Nets"
    return game_hash[:home][:colors]
  elsif team_name == "Charlotte Hornets"
    return game_hash[:away][:colors]
  end
end

def team_names
  teams = []
  teams.append(game_hash[:home][:team_name])
  teams.append(game_hash[:away][:team_name])
end

def player_numbers(team)
  array = []
  if game_hash[:home][:team_name] == team
    game_hash[:home][:players].each do |player, data|
      data.each do |title, stats|
        if title == :number
          array.append(stats)
        end
      end
    end
  else
    game_hash[:away][:players].each do |player, data|
      data.each do |title, stats|
        if title == :number
          array.append(stats)
        end
      end
    end
  end
  array
end

def player_stats(name)
  game_hash.keys.each do |team|
    if game_hash[team][:players].keys.include?(name)
      return game_hash[team][:players][name]
    end
  end
end

def big_shoe_rebounds
  biggest_shoe = nil
  rebounds = nil
  game_hash.each do |location, data|
    data.each do |key, value|
      if key == :players
        value.each do |player, stats|
          stats.each do |title, info|
            if title == :shoe
              if biggest_shoe == nil
                biggest_shoe = info
                rebounds = game_hash[location][:players][player][:rebounds]
              elsif info > biggest_shoe
                biggest_shoe = info
                rebounds = game_hash[location][:players][player][:rebounds]
              end
            end
          end
        end
      end
    end
  end
  rebounds
end
