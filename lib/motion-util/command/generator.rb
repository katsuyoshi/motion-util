# -*- coding: utf-8 -*-
module Motion
  module Util

    class Generator
    
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
