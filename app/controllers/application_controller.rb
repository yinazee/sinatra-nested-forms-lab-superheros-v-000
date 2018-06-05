require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    get '/teams' do
      @team = Team.new(params[:team])
      @super_hero = Team.each do |member|
        member.name
        member.power
        member.bio
      end
      erb :team
    end


end
