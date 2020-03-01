#!/usr/bin/ruby

require 'sinatra'

ENV['PATH_INFO'] = ENV['REDIRECT_PATHINFO']

excuses = File.open('bofh_excuses.txt', 'r').readlines
excuses.map! {|e| e.chomp }

get '/' do
    all = []
    e_count = excuses.size                      # Total excuses in list
    t_count = [params['count'].to_i, 1].max     # Target excuse count
    1.upto(t_count) do
        e = excuses[rand(e_count)]
        e = excuses[rand(e_count)] while all.member?(e)
        all.push e
    end
    erb :excuse, :locals => { :excuses => all, :count => t_count}
end

get '/*' do
    erb :p404
end
