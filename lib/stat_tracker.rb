require 'csv'

class StatTracker
  attr_reader :games,
              :teams,
              :game_teams

  def initialize(games = nil, teams = nil, game_teams = nil)
    @games = games
    @teams = teams
    @game_teams = game_teams
  end

  def self.from_csv(locations)
    games = CSV.read(locations[:games], headers: true, header_converters: :symbol)
    teams = CSV.read(locations[:teams], headers: true, header_converters: :symbol)
    game_teams = CSV.read(locations[:game_teams], headers: true, header_converters: :symbol)

    StatTracker.new(games, teams, game_teams)
  end

end
