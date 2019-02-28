# Andrew Lee
# 1436724
wordhash = {}

File.open(ARGV[0]).each { |line|
    words = line.split(' ') # array of words
    words.each do |word|
        wordhash.key?(word) ? wordhash[word] += 1 : wordhash[word] = 1
    end
}

sorted_keys = wordhash.keys.sort { |a, b| a <=> b}

sorted_keys.each { |word|
    puts "#{word} #{wordhash[word]}"
}