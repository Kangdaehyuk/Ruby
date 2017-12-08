Dir.chdir("src")

puts Dir.pwd

list =  Dir.entries(Dir.pwd).reject {|name| name[0] == "."}

# 19.times do |n|
#   File.rename("#{n+2}list.txt", "sap#{n+2}list.txt")
# end

list.each do |f|
  File.rename(f, "2017" + f)
end
