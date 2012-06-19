# -*- coding: utf-8 -*-
module Motion
  module Util


    def self.dispatch 
      cmd = eval("#{ARG[0].captalize}.new")
      if cmd.nil?
        puts 
        exit
      end
    end

  end
end
