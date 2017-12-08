Dir.chdir("src") #폴더 위치 변경

puts Dir.pwd #윈도우 상의 절대 경로 출력

20.times do |n|
	File.open("#{n+1}list.txt", "w") do |f|
	  f.write("#{n+1}번째 파일입니다.")
	end
end

#.txt20개를 만들자.
#몇번째 파일 + list
# 1list.txt
# 2list.txt
# 3list.txt

#파일 내용물 : n번째 파일입니다.

# age = 55
# puts "내 나이는 #{age}"
