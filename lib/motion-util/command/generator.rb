# -*- coding: utf-8 -*-
module Motion
  module Util

    class Generator
    
      def initialize
        d = File.dirname(__FILE__).split("/")[0..-4]
        d << "template"
        @template_dir = File.join d
      end
    
      def destination_dir
        case file_type.to_s
        when "general"
          "app"
        when /controller/
          "app/controller"
        else
          "app/#{file_type}"
        end
      end
      
      def destination_path
        case file_type
        when /controller/
          "#{destination_dir}/#{class_file_name}_#{file_type}.rb"
        else
          "#{destination_dir}/#{class_file_name}.rb"
        end
      end
      
      def context
        c = File.read File.join(@template_dir, "class", file_type + ".rb")
        c.gsub! /#\{class_name\}/, class_name
        c
      end

      def spec_context
        c = File.read File.join(@template_dir, "spec", "spec.rb")
        c.gsub! /#\{class_name\}/, class_name
        c
      end

    end
    
    
    private
    
    def file_type
      case ARGV[1]
      when /model/i, /controller/i, /view/i
        @file_type = ARGV[1].downcase
      else
        @file_type = "general"
      end if @file_type.nil?
      @file_type
    end
    
    def class_name
      case file_type
      when :general
        @class_name = ARGV[1].capitalize
      else
        @class_name = ARGV[2].capitalize
      end if @class_name.nil?
      @class_name
    end
    
    def class_file_name
      class_name.downcase
    end
    
  end
end
