# -*- coding: utf-8 -*-
module Motion
  module Util

    class Dispatcher
    
      attr_reader :project_dir
      
      def self.dispatcher
        @@despatcher ||= self.new
      end

      def initialize
        @project_dir = Dir.pwd
      end
      
      def self.dispatch
        begin 
          cmd = eval("#{ARGV[0].captalize}.new")
        rescue
        end
        if cmd.nil?
          $stderr.puts usage 
  #        exit
        end
      end
      
      def usage
        <<EOF
Usage:
motion-util: command [options]

Usage:

EOF
      end

    end
    
  end
end
