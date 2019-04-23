require_relative "scan.rb"
require 'readline'
class Parser
    def initialize
        # hash table to store bindings to variables
        @scan = Scanner.new
        @vars = {}
        @vars['PI'] = Math::PI
        @operations = nil
        @token = nil
        program
    end

    def program
        @token = @scan.next_token
        while @token.kind != "EOL"
            puts statement()
            @token = @scan.next_token
            if @token == nil
                break
            end
        end
        puts program
    end

    def statement
        num_expr_id_res = exp()
        if (num_expr_id_res.is_a? Numeric) && (@operations.kind != '=')
            puts num_expr_id_res   #its just the expr we eval'd
        else
            case @token.kind
            when "ID"
                if @operations.kind == '='
                    var = @token.value
                    bind = exp
                    @vars[var] = bind
                else
                    puts "no expr to bind ID to."
                end
            when "CLEAR"
                var_binding = @operations
                if var_binding.kind == "ID"
                    @vars.delete(var_binding.value)
                else
                    puts "unable to delete variable binding"
                end
            when "LIST"
                @vars.each do |key, value|
                    puts "#{key} is bound to #{value}"
                end
            when "QUIT"
                exit
            when "EXIT"
                exit
        end
    end
end

    def exp
        num_exp = term
        if @operations.kind == '+'
            return num_exp + term
        elsif @operations.kind == '-'
            return num_exp - term
        else
            return num_exp
        end
    end

    def term
        num = power
        if @operations.kind == '*'
            return num * power
        elsif @operations.kind == '/'
            return num / power
        else
            return num
        end
    end

    def power
        num = factor
        @operations = @scan.next_token
        if num.is_a? Numeric
            if @operations.kind == "**"
                exponent_num = power
                return num.to_f ** exponent_num.to_f
            else
                return num
            end
        else
            return num
        end
    end

    def factor
        unless @scan.next_token.nil?
            @token = @scan.next_token
            case @token.kind
            when "NUMBER"
                return @token.value.to_f
            when "ID"
                if @vars[@token.value] != nil
                    return @vars[@token.value]
                else
                    return ''
                end
            when "("
                return exp()
            when "SQRT"
                @scan.next_token
                num = exp()
                if (num.is_a? Numeric)
                    return Math.sqrt(num)
                else
                    puts "FAILURE-->value inside sqrt func must be a number"
                end
            end
        end
    end
end
calculator = Parser.new
