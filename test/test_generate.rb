# -*- coding: utf-8 -*-
require 'test-unit'
require 'motion-util'


include Motion::Util

class TestGenerate < Test::Unit::TestCase

  def setup
    ARGV.replace %w(generate)
    @generator = Generator.new
  end
  
  test "destination_dir path shoudle be 'app'" do
    assert_equal "app", @generator.destination_dir
  end
  
  test "destination_path shoudle be 'app/model/foo.rb' with model, foo" do
    ARGV.replace %w(generate model foo)
    assert_equal "app/model/foo.rb", @generator.destination_path
  end
  
  test "destination_path shoudle be 'app/view/foo.rb' with view, foo" do
    ARGV.replace %w(generate view foo)
    assert_equal "app/view/foo.rb", @generator.destination_path
  end
  
  test "destination_path shoudle be 'app/controller/foo_controller.rb' with controller, foo" do
    ARGV.replace %w(generate controller foo)
    assert_equal "app/controller/foo_controller.rb", @generator.destination_path
  end
  
  test "destination_path shoudle be 'app/controller/foo_view_controller.rb' with view_controller, foo" do
    ARGV.replace %w(generate view_controller foo)
    assert_equal "app/controller/foo_view_controller.rb", @generator.destination_path
  end
  
  test "destination_path shoudle be 'app/controller/foo_table_view_controller.rb' with table_view_controller, foo" do
    ARGV.replace %w(generate table_view_controller foo)
    assert_equal "app/controller/foo_table_view_controller.rb", @generator.destination_path
  end
  
  test "destination_path shoudle be 'app/controller/foo_navigation_view_controller.rb' with table_view_controller, foo" do
    ARGV.replace %w(generate navigation_view_controller foo)
    assert_equal "app/controller/foo_navigation_view_controller.rb", @generator.destination_path
  end
  
  test "destination_path shoudle be 'app/controller/foo_tab_view_controller.rb' with table_view_controller, foo" do
    ARGV.replace %w(generate tab_view_controller foo)
    assert_equal "app/controller/foo_tab_view_controller.rb", @generator.destination_path
  end
  
=begin
  test 'generate foo.rb' do
    ARGV.replace %w(generate model foo)
    @generator.execute
    assert_equal expected, File.read()
  end
=end


end
