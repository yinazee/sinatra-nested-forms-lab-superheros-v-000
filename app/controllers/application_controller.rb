require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    get '/teams' do
      @team_name = Team.new(params[:team][:name])
      @team_motto = Team.new(params[:team][:motto])
          binding.pry
      @hero_name = []
      @hero_power =[]
      @hero_bio = []
      @team_members = params[:team][:members]

      @team_members.each do |member|
        @hero_name << member.name
        @hero_power << member.power
        @hero_bio << member.bio
      end
      erb :team

    end


end
