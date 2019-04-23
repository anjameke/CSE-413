# # Andrew Lee
# # 1436724
require 'readline'

class Token
    #class constants as regex's
    OP = /^[\+\-\*\/\=\(\)]$/
    NUM = /([0-9]+)(.[0-9]+)?([eE][0-9]+)?/
    LETTERS = /[a-zA-Z]/
    LETNUM = /[a-zA-Z][a-zA-Z0-9_]*/
    ID = /^[a-zA-Z][a-zA-Z0-9_]*$/
    BASICNUM = /[0-9]/
    RES = /^list$|^quit$|^exit$|^clear$|^sqrt$/
    EOL = /^;$/
    SPACE = /^\s/
    
    attr_accessor :kind, :value
   # attr_accessor :value
    def initialize(kind, value=nil)
        @kind = kind
        @value = value
    end

    def to_s
        if @value != nil
            puts "#{@kind}(#{@value})"
        else
            puts "#{@kind}"
        end
    end
end

class Scanner
	attr_accessor :input
	
    def initialize()
        # for whatever reason the regex for newline won't get mathched
        # in my case for @input[0], so i had to replace it with a ';' char
        # totally unsure what i was missing with my regex matching.
		@input = Readline.readline.gsub(/\n/, "") << ';'
	end
		
    def next_token()
		while(@input[0] == "\s" || @input[0] == "\t")
			@input = @input[1..-1]
		end
        if(@input == "")
          #  token = Token.new("EOL")
			@input = Readline.readline
			while(@input[0] == "\s" || @input[0] == "\t")
				@input = @input[1..-1]
            end
        #    return token
		end
		
		case @input[0]
		when Token::EOL
			token = Token.new('EOL')
			@input = @input[1..-1]
            return token
		when '+'
			token = Token.new('+')
			@input = @input[1..-1]
			return token
		when '-'
			token = Token.new('-')
			@input = @input[1..-1]
            return token
        when '='
			token = Token.new('=')
			@input = @input[1..-1]
			# puts token
		when '*'
			if(@input[1] == "*")
				token = Token.new('**')
				@input = @input[2..-1]
				return token
			else
				token = Token.new('*')
				@input = @input[1..-1]
				return token
            end
        when '('
			token = Token.new('(')
			@input = @input[1..-1]
			# puts token
			return token
		when ')'
			token = Token.new(')')
			@input = @input[1..-1]
			# puts token
			return token
		when '/'
			token = Token.new('/')
			@input = @input[1..-1]
			# puts token
			return token
		when Token::BASICNUM
			advanced_num_list = @input.match(Token::NUM)
			token = Token.new('NUMBER', advanced_num_list[0].to_f)
			@input = @input[advanced_num_list[0].length..-1]
			return token
		when Token::LETTERS
			keyword_list = @input.match(Token::LETNUM)
			keyword = keyword_list[0].downcase
            # handles potential unknown casing, but correct spelling for keywords
			case keyword
			when 'list'
				token = Token.new('LIST')
				@input = @input[keyword.length..-1]
			#	puts token
				return token
			when 'exit'
				token = Token.new('EXIT')
				@input = @input[keyword.length..-1]
				puts "EXITING..."
				return token
			when 'quit'
				token = Token.new('QUIT')
				@input = @input[keyword.length..-1]
			    puts "QUITTING..."
				return token
			when 'sqrt'
				token = Token.new('SQRT')
				@input = @input[keyword.length..-1]
				# puts token
				return token
			when 'clear'
				token = Token.new('CLEAR')
				@input = @input[keyword.length..-1]
				return token
			else 
				token = Token.new('ID', keyword)
				@input = @input[keyword.length..-1]
				return token
			end	
		else
			puts "unknown or invalid token, please try again..."
            @input = @input[1..-1]
            # lets try again
			return next_token
		end	
	end
end
