# Andrew Lee
# 1436724
require_relative "scan.rb"

s = Scanner.new
t = s.next_token

while t.kind != 'EXIT' && t.kind != 'QUIT' && t.kind != 'EOF'
    puts t.to_s
	t = s.next_token
end
