# class Pry
#   class Command
#     def tokenize(val, extra=nil)
#       binding.pry if extra
#       val.replace(interpolate_string(val)) if command_options[:interpolate]

#       self.class.command_regex =~ val

#       # please call Command.matches? before Command#call_safely
#       raise CommandError, "fatal: called a command which didn't match?!" unless Regexp.last_match
#       captures = Regexp.last_match.captures
#       pos = Regexp.last_match.end(0)

#       arg_string = val[pos..-1]

#       # remove the one leading space if it exists
#       arg_string.slice!(0) if arg_string.start_with?(" ")

#       # process and pass a block if one is found
#       pass_block(arg_string) if command_options[:takes_block]

#       if arg_string
#         args = command_options[:shellwords] ? Shellwords.shellwords(arg_string) : arg_string.split(" ")
#       else
#         args = []
#       end

#       [val[0..pos].rstrip, arg_string, captures, args]
#     end
#   end
# end