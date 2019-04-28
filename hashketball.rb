# Write your code here!

#def/end -- dont need it bc this isnt method, its var.
#correct way to write hash is either :example => {} OR example:{}

require 'pry'

def game_hash
   {
     :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"], #anything that isn't specific type of data -- by itself-- ruby will try to interpret that, so added string to color bc its not a ruby key word or anything to be interpreted.
    :players => {
      "Alan Anderson" => {number:0, shoe:16, points:22,rebounds:12, assists:12, steals:3, blocks:1, slam_dunks:1},
      "Reggie Evans" => {number:30, shoe:14, points:12,rebounds:12, assists:12, steals:12, blocks:12, slam_dunks:7},
      "Brook Lopez" => {number:11, shoe:17, points:17,rebounds:19, assists:10, steals:3, blocks:1, slam_dunks:15},
      "Mason Plumlee" => {number: 1, shoe:19, points:26,rebounds:12, assists:6, steals:3, blocks:8, slam_dunks:5},
      "Jason Terry" => {number: 31, shoe:15, points:19,rebounds:2, assists:2, steals:4, blocks:11, slam_dunks:1}
    }
  }, #needed to add , after the } bc there is a second part

:away => {

  :team_name => "Charlotte Hornets",
  :colors => ["Turquoise", "Purple"],
  :players => { # [ for arrays ] {for hashes} -- key value pairs which we have here
      "Jeff Adrien" => {number:4, shoe:18, points:10,rebounds:1, assists:1, steals:2, blocks:7, slam_dunks:2},
      "Bismak Biyombo" => {number:0, shoe:16, points:12,rebounds:4, assists:7, steals:7, blocks:15, slam_dunks:10},
      "DeSagna Diop" => {number:2, shoe:14, points:24,rebounds:12, assists:12, steals:4, blocks:5, slam_dunks:5},
      "Ben Gordon" => {number:8, shoe:15, points:33,rebounds:3, assists:2, steals:1, blocks:1, slam_dunks:0},
      "Brendan Haywood" => {number:33, shoe:15, points:6,rebounds:12, assists:12, steals:22, blocks:5, slam_dunks:12}
      } #since its a hash and not an array
    }
}
end


def num_points_scored(player_name)
  result = 0
    game_hash.each do |keys, values|
      values.each do |data_k, data_v|
        if data_k == :players
          data_v.each do |current_player, player_data|
            if player_name == current_player
              result = player_data[:points]   #.to_i  #takes the string & makes it into an int.
            end
          end
        end
      end
    end
  result
end

def shoe_size(player_name)
  result = 0
    game_hash.each do |keys, values|
      values.each do |data_k, data_v|
        if data_k == :players
          data_v.each do |current_player, player_data|
            if player_name == current_player
                result = player_data[:shoe]   #defined in this if block -- so you dont have access when outside of that if block -- once def. outside of block, -- has to do with scope
            end
          end
        end
      end
    end
  result
end



def team_colors(name_of_team)
  hash = []
    game_hash.each do |keys, values|
      values.each do |data_k, data_v|
        if data_v == name_of_team
         hash << game_hash[keys][:colors]
       end
      end
    end
  hash.flatten
end


def team_names
  hash = []
   game_hash.each do |keys, values|
    values.each do |data_k, data_v|
        if data_k == :team_name #call it as a key and not a string as you were b4
          hash << data_v #[:team_name].join(",")

          #binding.pry
        end
      end
    end
  hash #want hash  to be the last thing to run in this method -- remember to match up return when calling it
end



def player_numbers(teams)
  hash = []
    if game_hash[:home][:team_name] == teams
        game_hash[:home][:players].each do |name, stats| #name in a string -- displaying stats with all info in the array
          stats.each do |stat_k, stat_v| #iterate through stats which include keys and values
          if stat_k == :number  #if the key is number we return array with it's value
            hash << stat_v
          end
        end
      end
    else
      game_hash[:away][:players].each do |name, stats|
        stats.each do |stat_k, stat_v|
          if stat_k == :number
            hash << stat_v
          end
        end
      end
    end
  hash
end

def player_stats(player_name)
  hash = {} #empty hash
    game_hash.each do |keys, values|
      values.each do |stat_k, stat_v|
        if stat_k == :players
          stat_v.each do |player_n, player_value|
            if player_n == player_name
              hash = player_value
          #hash = stat_v #[:number][:shoe][:points][:rebounds][:assists][:steals][:blocks][:slam_dunks] #reset to player stats
              end
            end
          end
        end
      end
    hash
  end

def big_shoe_rebounds
  biggest_shoe = nil
    biggest_shoe_rebounds = nil
      game_hash.each do |keys, values|
        values.each do |stat_k, stat_v|
          if stat_k == :players
            stat_v.each do |player_name, player_data|
                #binding.pry
                if biggest_shoe == nil
                  biggest_shoe = player_data[:shoe]
                    biggest_shoe_rebounds = player_data[:rebounds] #in player_data with the person with biggest shoe -- calling their rebound  #game_hash[keys][:players][:shoe][:rebounds]
                elsif player_data[:shoe] > biggest_shoe
                          biggest_shoe = player_data[:shoe]
                          biggest_shoe_rebounds = player_data[:rebounds]  #biggest_shoe_player_rebounds = game_hash[keys][:players][:rebounds]
                      end
                    end
                  end
                end
              end
            biggest_shoe_rebounds
          end

#there was a scope issue here because you can't invent variables in the middle of a block -- so always set it to a value of something like nil at the top.
















#fig out name of player who has larget shoe size, then call rebound method & pass in players name & then you'll get result


#def most_points_scored

#end


#  def winning_team


#  end


#   def player_with_longest_name
#     long_name = nil
#       game_hash.each do |keys, values|
#         keys.each do |player_name, player_info|
#           if player_name == :players
#               player_name.length
#
#       end
#     end
#   end
# end
