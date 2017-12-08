require "sinatra"


#사용자가 앱에 들어오면 글자 할당
get "/" do
  send_file "home.html" #/url로 요청이 오면 여기로 보냄.
end

get "/me" do
  send_file "me.html"
end

get "/dinner" do
  menu = ["랍스터", "참치", "소고기", "케비아"]
  @choice = menu.sample
  @url = { #key와 value
    "참치" => 'http://mmzz.co.kr/app/file2/h_0001/237/1372144986_2.jpg',
    "랍스터" => 'http://cfile22.uf.tistory.com/image/2415F94E55276A3C140D02',
    "소고기" => 'http://cfile24.uf.tistory.com/image/224F224E57F900713DC2D8',
    "케비아" => 'http://caviarhouse.co.kr/youngcart4/images/blog/3.jpg'
  }

  # "
  # <p>#{choice}</p>
  # <img src=#{url[choice]}></img>
  # "
  erb:dinner
  #url[key값]입력해주면 value값 반환
end
