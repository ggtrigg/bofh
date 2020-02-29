#!/usr/bin/ruby

require 'sinatra'

excuses = File.open('bofh_excuses.txt', 'r').readlines

get '/' do
    all = []
    e_count = excuses.size
    1.upto([params['count'].to_i, 1].max) do
        e = excuses[rand(e_count)].chomp # while all.member? e
        all << e
    end
    erb :excuse, :locals => { :excuses => all}
end

get '/*' do
    erb :p404
end