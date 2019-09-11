require 'pry'

def game_hash

    {
        :home => {
            :team_name => 'Brooklyn Nets',
            :colors => ['Black', 'White'],
            :players => [
                { 'Alan Anderson' => {
                    :number => 0,
                    :shoe => 16,
                    :points => 22,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 1
                    }    
                },
                { 'Reggie Evans' => {
                    :number => 30,
                    :shoe => 14,
                    :points => 12,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 12,
                    :blocks => 12,
                    :slam_dunks => 7
                    }    
                },
                { 'Brook Lopez' => {
                    :number => 11,
                    :shoe => 17,
                    :points => 17,
                    :rebounds => 19,
                    :assists => 10,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 15
                    }   
                },
                { 'Mason Plumlee' => {
                    :number => 1,
                    :shoe => 19,
                    :points => 26,
                    :rebounds => 11,
                    :assists => 6,
                    :steals => 3,
                    :blocks => 8,
                    :slam_dunks => 5
                    }    
                },
                { 'Jason Terry' => {
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
            ]
        },
        :away => {
            :team_name => 'Charlotte Hornets',
            :colors => ['Turquoise', 'Purple'],
            :players => [
                { 'Jeff Adrien' => {
                    :number => 4,
                    :shoe => 18,
                    :points => 10,
                    :rebounds => 1,
                    :assists => 1,
                    :steals => 2,
                    :blocks => 7,
                    :slam_dunks => 2
                    }  
                },
                { 'Bismack Biyombo' => {
                    :number => 0,
                    :shoe => 16,
                    :points => 12,
                    :rebounds => 4,
                    :assists => 7,
                    :steals => 22,
                    :blocks => 15,
                    :slam_dunks => 10
                    } 
                },
                { 'DeSagna Diop' => {
                    :number => 2,
                    :shoe => 14,
                    :points => 24,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 4,
                    :blocks => 5,
                    :slam_dunks => 5
                    } 
                },
                { 'Ben Gordon' => {
                    :number => 8,
                    :shoe => 15,
                    :points => 33,
                    :rebounds => 3,
                    :assists => 2,
                    :steals => 1,
                    :blocks => 1,
                    :slam_dunks => 0
                    } 
                },
                { 'Kemba Walker' => {
                    :number => 33,
                    :shoe => 15,
                    :points => 6,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 7,
                    :blocks => 5,
                    :slam_dunks => 12
                    }
                }
            ]
        }
    }
end

def num_points_scored(player_name)
    points = nil

    game_hash.each do |location, team_info|
        team_info[:players].each do |player|
            if player[player_name]
                points = player[player_name][:points]
            end
        end
    end

    return points
end

def shoe_size(player_name)
    shoe_size = nil

    game_hash.each do |location, team_info|
        team_info[:players].each do |player|
            if player[player_name]
                shoe_size = player[player_name][:shoe]
            end
        end
    end

    return shoe_size
end

def team_colors(team_name)
    colors = nil

    game_hash.each do |location, team_info|
        if team_info[:team_name] == team_name
            colors = team_info[:colors]
        end
    end

    return colors
end

def team_names
    team_names = []

    game_hash.each do |location, team_info|
        team_names << team_info[:team_name]
    end

    return team_names
end

def player_numbers(team_name)
    jersey_numbers = []

    game_hash.each do |location, team_info|
        if team_info[:team_name] == team_name
            team_info[:players].each do |player|
                player.each do |player_name, stats|
                    jersey_numbers << stats[:number]
                end
            end
        end
    end

    return jersey_numbers
end

def player_stats(player_name)
    player_stats = nil

    game_hash.each do |location, team_info|
        team_info[:players].each do |player|
            player.each do |name, stats|
                if name == player_name
                    player_stats = stats
                end
            end
        end
    end

    return player_stats
end

def big_shoe_rebounds()
    largest_shoe_size = 0
    big_shoe_player = nil
    rebounds = nil

    game_hash.each do |location, team_info|
        team_info[:players].each do |player|
            player.each do |name, stats|
                if stats[:shoe] > largest_shoe_size
                    largest_shoe_size = stats[:shoe]
                    big_shoe_player = name
                end
            end
        end
    end

    game_hash.each do |location, team_info|
        team_info[:players].each do |player|
            player.each do |name, stats|
                if name == big_shoe_player
                    rebounds = stats[:rebounds]
                end
            end
        end
    end

    return rebounds
end

########## Bonus Section ##########

def most_points_scored
    most_points = 0
    most_points_player = nil

    game_hash.each do |location, team_info|
        team_info[:players].each do |player|
            player.each do |name, stats|
                if stats[:points] > most_points
                    most_points = stats[:points]
                    most_points_player = name
                end
            end
        end
    end

    return most_points_player
end

def winning_team
    home_points_scored = 0
    away_points_scored = 0

    game_hash[:home][:players].each do |player|
        player.each do |name, stats|
            home_points_scored += stats[:points]
        end
    end

    game_hash[:away][:players].each do |player|
        player.each do |name, stats|
            away_points_scored += stats[:points]
        end
    end

    if home_points_scored > away_points_scored
        game_hash[:home][:team_name]
    else
        game_hash[:away][:team_name]
    end
end

def player_with_longest_name
    longest_name_length = 0
    longest_name = nil

    game_hash.each do |location, team_info|
        team_info[:players].each do |player|
            player.each do |name, stats|
                if name.length > longest_name_length
                    longest_name_length = name.length
                    longest_name = name
                end
            end
        end
    end

    return longest_name
end

##### Super Bonus (uses a helper method that we've already written) #####

def long_name_steals_a_ton?
    longest_name = player_with_longest_name
    most_steals = 0
    player_with_most_steals = nil

    game_hash.each do |location, team_info|
        team_info[:players].each do |player|
            player.each do |name, stats|
                if stats[:steals] > most_steals
                    most_steals = stats[:steals]
                    player_with_most_steals = name
                end
            end
        end
    end

    longest_name == player_with_most_steals
end









