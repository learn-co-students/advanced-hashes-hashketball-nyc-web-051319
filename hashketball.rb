require 'pry'
def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
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
      "Reggie Evans" => { :number => 30,
      :shoe => 14,
      :points => 12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7
    },
      "Brook Lopez" => { :number => 11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 15
    },
      "Mason Plumlee" => { :number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds => 12,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5
    },
      "Jason Terry" => { :number => 31,
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
  "Bismack Biyombo" => { :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 7,
    :blocks => 15,
    :slam_dunks => 10
  },
    "DeSagna Diop" => { :number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5
    },
    "Ben Gordon" => { :number => 8,
      :shoe => 15,
      :points => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0
    },
    "Brendan Haywood" => { :number => 33,
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
hash = game_hash
words = " "
  hash.each do |location,info|
    info.each do |attribute,y|
  if attribute == :players
        y.each do |player_name,stat|
          if player_name == name
 words = stat[:points]
          end
        end

    end
  end
end
words
end

def shoe_size(name)
hash = game_hash
words = " "
  hash.each do |location,info|

    info.each do |attribute,y|
  if attribute == :players
        y.each do |player_name,stat|
          if player_name == name
 words = stat[:shoe]
          end
        end

    end
  end
end
words
end

def team_colors(team)
hash = game_hash
words = " "
  hash.each do |location,info|
    info.each do |attribute,y|

  if y == team

 words = info[:colors]
          end
        end

    end
words
end

def team_names
hash = game_hash
words = []
  hash.each do |location,info|

      words << info[:team_name]
    end

words
end

def player_numbers(name)
hash = game_hash
words = []
  hash.each do |location,info|
    info.each do |attribute,y|

  if attribute == :team_name
    if y == name
info[:players].each do |player_name, stats|
  words << stats[:number]
end
end
  end
end
end
words
end

def player_stats(name)
  hash = game_hash
  words = {}
    hash.each do |location,info|
      info.each do |attribute,y|
    if attribute == :players
          y.each do |player_name,x|
            if player_name == name
   words =  x
            end
          end

      end
    end
  end
  words
  end

  def big_shoe_rebounds
    hash = game_hash
big_shoe = 0
most_rebound = 0
    hash.each do |location,info|
      info.each do |attribute,y|
if attribute == :players
      y.each do |player_name, v|
      if v[:shoe] > big_shoe
        big_shoe = v[:shoe]
        if big_shoe == v[:shoe]
        most_rebound = v[:rebounds]


end
        end

        end
      end

    end
    end
most_rebound
  end
