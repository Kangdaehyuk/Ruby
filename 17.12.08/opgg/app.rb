require 'sinatra'
require 'httparty'
require 'nokogiri'
require 'uri'
require 'csv'
require 'date'

get '/' do
  erb:index
end

get '/search' do
  @id = params["id"]

  encoded = URI.encode(@id) #받아온 아이디 인코딩

  url = "http://www.op.gg/summoner/userName=#{encoded}"
  response = HTTParty.get(url)

  html = Nokogiri::HTML(response.body)
  @win = html.css("#SummonerLayoutContent > div.tabItem.Content.SummonerLayoutContent.summonerLayout-summary > div.SideContent > div.TierBox.Box > div.SummonerRatingMedium > div.TierRankInfo > div.TierInfo > span.WinLose > span.wins")
  @lose = html.css("#SummonerLayoutContent > div.tabItem.Content.SummonerLayoutContent.summonerLayout-summary > div.SideContent > div.TierBox.Box > div.SummonerRatingMedium > div.TierRankInfo > div.TierInfo > span.WinLose > span.losses")
  File.open("log.txt", "a+") do |f|
	  f.write("#{@id}, #{@win.text}, #{@lose.text}" + "\n")
	end

  CSV.open("log.csv", "a+") do |csv|
    csv << [@id, @win.text, @lose.text, Time.now.to_s]
  end

  erb:search
end
