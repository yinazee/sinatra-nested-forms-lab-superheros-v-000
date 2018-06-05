require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do
      @team_name = Team.new(params[:team][:name])
      @team_motto = Team.new(params[:team][:motto])
      @hero_name = []
      @hero_power =[]
      @hero_bio = []
      @team_members = params[:team][:members]

      @team_members.each do |member|
        binding.pry
        @hero_name << member.name
        @hero_power << member.power
        @hero_bio << member.bio
      end
      erb :team

    end


end
