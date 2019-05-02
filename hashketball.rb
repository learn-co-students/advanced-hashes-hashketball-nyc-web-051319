# Write your code here!
require 'pry'

def game_hash
  game = {
    home:{
        team_name: "Brooklyn Nets",
        colors:["Black", "White"],
        players:{
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
    away:{
      team_name: "Charlotte Hornets",
      colors:["Turquoise", "Purple"],
      players:{
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
        "Bismak Biyombo" => {
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
end

def num_points_scored (player_name)
  #returns number of points scored
  points_scored = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player == player_name
            stats.each do |stat_type, info|
              if stat_type == :points
                points_scored = info
              end
            end
          end
        end
      end
    end
  end
  points_scored
end

def shoe_size(player_name)
  shoesize = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player == player_name
            stats.each do |stat_type, info|
              if stat_type == :shoe
                shoesize = info
              end
            end
          end
        end
      end
    end
  end
  shoesize
end

def team_colors(team_name)
  teamColors = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == team_name
        teamColors = game_hash[location][:colors]
      end
    end
  end
  teamColors
end

def team_names
  teamNames = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        teamNames << data
      end
    end
  end
  teamNames
end

def player_numbers(team_name)
  jersey = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == team_name
        game_hash[location][:players].each do |player, info|
          info.each do |stat_type, stat|
            if stat_type == :number
              jersey << stat
            end
          end
        end
      end
    end
  end
  jersey
end

def player_stats(player_name)
  player_stats = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player,stats|
          if player == player_name
            player_stats = stats
          end
        end
      end
    end
  end
  player_stats
end

def big_shoe_rebounds
  biggest = 0
  rebound = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stat|
      size = stat[:shoe]
      if size > biggest
        biggest = size
        rebound = stat[:rebounds]
      end
    end
  end
  rebound
end

def most_points_scored
  mostscore = 0
  player = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |this_player, stat|
      score = stat[:points]
      if score > mostscore
        mostscore = score
        player = this_player
      end
    end
  end
  player
end

def winning_team
  score_keeper = {}

  game_hash.each do |location, team_data|
    score = 0
    team_data[:players].each do |player, info|
      score += info[:points]
    end
    score_keeper[team_data[:team_name]] = score
  end

  winner = ""

  score_keeper.each do |k,v|
    if v == score_keeper.values.max
      winner = k
    end
  end

  winner

end

def player_with_longest_name
  length_counter = {}

  game_hash.each do |location, team_data|
    count = 0
    team_data[:players].each do |name, info|
      count += name.length
      length_counter[name] = count
    end
  end

  player = ""
  length_counter.each do |k,v|
    if v == length_counter.values.max
      player = k
    end
  end

  player
end

def long_name_steals_a_ton?
  steal_counter = {}

  game_hash.each do |location, team_data|
    count = 0
    team_data[:players].each do |name, info|
      count += info[:steals]
      steal_counter[name] = count
    end
  end

  steal_player = ""

  steal_counter.each do |k,v|
    if v == steal_counter.values.max
      steal_player = k
    end
  end

  if steal_player == player_with_longest_name
    true
  else
    false
  end

end
