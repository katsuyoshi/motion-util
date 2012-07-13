# -*- coding: utf-8 -*-
module Motion
  module Util

    class Generator
    
      def initialize
        d = File.dirname(__FILE__).split("/")[0..-4]
        d << "template"
        @project_path = Dir.pwd
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
        when /controller/, /view/
          "#{destination_dir}/#{class_file_name}_#{file_type}.rb"
        else
          "#{destination_dir}/#{class_file_name}.rb"
        end
      end
      
      def spec_destination_path
        d = destination_path.gsub /^app/, "spec"
        d.gsub /\.rb$/, "_spec.rb"
      end
      
      def context
        c = File.read File.join(@template_dir, "class", file_type + ".rb")
        c.gsub! /#\{class_name\}/, class_name
        c
      end

      def spec_context
        c = File.read File.join(@template_dir, "spec", "spec.rb")
        c.gsub! /#\{class_name\}/, class_name
        c.gsub! /#\{camelized_file_type\}/, camelized_file_type
        c
      end

    
      def run
        make_file
        make_spec_file
      end
    
      private
      
      def make_file
        d = File.join @project_path, destination_path
        unless File.exist? d
          FileUtils.mkdir_p File.dirname(d)
          File.open(d, "w") do |f|
            f.write context
          end
          $stdout.puts "\tcreate: #{destination_path}"
        else
          $stderr.puts "#{destination_path} is already created!"
        end
      end
      
      def make_spec_file
        d = File.join @project_path, spec_destination_path
        unless File.exist? d
          FileUtils.mkdir_p File.dirname(d)
          File.open(d, "w") do |f|
            f.write spec_context
          end
          $stdout.puts "\tcreate: #{spec_destination_path}"
        else
          $stderr.puts "#{spec_destination_path} is already created!"
        end
      end
      
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
        when "general"
          @class_name = ARGV[1].capitalize
        else
          @class_name = ARGV[2].capitalize
        end if @class_name.nil?
        @class_name
      end
      
      def camelized_file_type
        case file_type
        when "general", "model"
          ""
        else
          @file_type.split('_').map{|e| e.capitalize}.join('')
        end
      end
      
      def class_file_name
        class_name.downcase
      end
      
    end
  end
end
