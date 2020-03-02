#!/usr/bin/ruby

require 'sinatra'

ENV['PATH_INFO'] = ENV['REDIRECT_PATHINFO']

excuses = File.open('bofh_excuses.txt', 'r').readlines
excuses.map! {|e| e.chomp }

get '/' do
    t_count = [params['count'].to_i, 1].max     # Target excuse count
    erb :excuse, :locals => { :excuses => excuses.sample(t_count), :count => t_count}
end

get '/*' do
    erb :p404
end
