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
motion-util: command [options]

Usage:

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
          IBHeader.generate
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
