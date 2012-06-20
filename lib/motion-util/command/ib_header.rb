# -*- coding: utf-8 -*-
module Motion
  module Util

    class IbHeader
    
      attr_reader :class_name, :super_name, :properties
      
      def source= source
        @source = source
        parse
      end
      
      private
      
      def parse
        /class\s+(\w+)\s*(<\s*(\w+))?/ =~ @source
        @class_name = $1
        @super_name = $3
        
        @properties = {}
        @source.split("\n").each do |l|
          /(attr_accessor|attr_reader)\s+([A-Za-z0-9:, ]+)(#\s*(@type_info\s+(\w+)?)?)?/ =~ l
          type = type_of $5
          $2.split(",").each do |p|
            p = eval(p.strip)
            @properties[p] = { type:type }
            @properties[p].merge!(readonly:true) if $1 == "attr_reader"
          end if $2
        end
      end
      
      def type_of t
        case t
        when nil, "id"
          "id"
        when "String"
          "NSString *"
        when "Hash"
          "NSDictionary *"
        else
          "#{t} *"
        end
      end
      
    end
    
  end
end

    
