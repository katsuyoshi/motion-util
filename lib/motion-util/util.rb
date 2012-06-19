# -*- coding: utf-8 -*-
module Motion
  module Util

    class Dispatcher
    
      attr_reader :project_dir
      
      
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
      def initialize
        @project_dir = Dir.pwd
      end
      
      def dispatch
        begin 
          cmd = eval("#{ARGV[0].captalize}.new")
        rescue
        end
        if cmd.nil?
          $stderr.puts self.class.usage 
          exit
        end
      end
      
    end
    
  end
end
