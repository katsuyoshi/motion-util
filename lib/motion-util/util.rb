# -*- coding: utf-8 -*-
module Motion
  module Util

    class Dispatcher
    
      # --- class methods
      class << self
      
        def dispatcher
          @@despatcher ||= self.new
        end

        def usage
          <<-EOF
Usage:
motion-util: command [subcommand] [options]

command:
  generate    Generate class and spec files.
              You can use g or generator instead of generate.
  ib_header   Generate Objective-C header files for Interface Builder.
              You can use ibh instead of ib_header.

          EOF
        end

      end
      
      
      # --- instance methoods
      def run
        cmd = nil
        case ARGV[0]
        when "generate", "generator", "g"
          cmd = Generator.new
        when "ib_header", "ibh"
          cmd = IbHeaderGenerator.new
        end
        if cmd
          cmd.run
        else
          $stderr.puts self.class.usage 
          exit
        end
      end
      
    end
    
  end
end
