# encoding: utf-8

require 'bundler'
require 'erb'
Bundler.require

class App < Sinatra::Base

  configure :development do
    require 'sinatra/reloader'
    register Sinatra::Reloader
  end

  # Page samples

  get '/' do
    slim :index
  end

  # Assets

  get '/assets/application.css' do
    headers "Content-Type" => "text/css"

    @background = "#c00"

    erb = ERB.new(File.read("./assets/css/application.scss.erb"))
    scss = erb.result(binding)
    Sass.compile scss, syntax: :scss
  end

end
