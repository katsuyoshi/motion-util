# -*- coding: utf-8 -*-
module Motion
  module Util

    class IbHeaderGenerator
      def run
        project_dir = Dir.pwd
        dst_dir = File.join project_dir, "tmp", "header"
        FileUtils.mkdir_p dst_dir
        Dir.glob("app/**/*.rb") do |f|
          ib = IbHeader.new
          ib.source = File.read(f)
          dst_name = ib.dst_name_of f
          dst = File.join(dst_dir, dst_name)
          FileUtils.mkdir_p File.dirname(dst)
          File.open(dst, "w") do |f|
            f.write(ib.context)
          end
        end
      end
    end
    
    class IbHeader
    
      attr_reader :class_name, :super_name, :properties
      
      def source= source
        @source = source
        parse
      end
      
      def context
        lines = []
        lines << "@interface #{@class_name} : #{@super_name || 'NSObject'}"
        properties.each do |k, v|
          if v[:readonly]
            lines << "@property (strong, nonatomic, readonly) IBOutlet #{type_name_of v[:type]}#{k};"
          else
            lines << "@property (strong, nonatomic) IBOutlet #{type_name_of v[:type]}#{k};"
          end
        end
        lines << "@end"
        lines << ""
        lines.join "\n"
      end
      
      def dst_name_of path
        a = path.split("/")
        a.pop
        a << "#{class_name}.h"
        a.join("/")
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
      
      def type_name_of type
        type == "id" ? "id " : type
      end
      
    end
    
  end
end

    
