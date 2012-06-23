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
  
  test "destination_path shoudle be 'app/controller/foo_navigation_controller.rb' with table_view_controller, foo" do
    ARGV.replace %w(generate navigation_controller foo)
    assert_equal "app/controller/foo_navigation_controller.rb", @generator.destination_path
  end
  
  test "destination_path shoudle be 'app/controller/foo_tab_bar_controller.rb' with tab_bar_view_controller, foo" do
    ARGV.replace %w(generate tab_bar_controller foo)
    assert_equal "app/controller/foo_tab_bar_controller.rb", @generator.destination_path
  end
  
  test "spec_destination_path shoudle be 'spec/controller/foo_tab_bar_controller.rb' with tab_bar_view_controller, foo" do
    ARGV.replace %w(generate tab_bar_controller foo)
    assert_equal "spec/controller/foo_tab_bar_controller_spec.rb", @generator.spec_destination_path
  end
  

  test "destination_path shoudle be 'app/foo.rb' with foo" do
    ARGV.replace %w(generate foo)
    assert_equal "app/foo.rb", @generator.destination_path
  end
  
  # --- context
  test "check model file context" do
    ARGV.replace %w(generate model foo)
    expected = <<-EOF
# -*- coding: utf-8 -*-
class Foo
end
    EOF
    assert_equal expected, @generator.context
  end
  
  test "check controller file context" do
    ARGV.replace %w(generate controller foo)
    expected = <<-EOF
# -*- coding: utf-8 -*-
class FooController
end
    EOF
    assert_equal expected, @generator.context
  end
  

  test "check view file context" do
    ARGV.replace %w(generate view foo)
    expected = <<-EOF
# -*- coding: utf-8 -*-
class FooView < UIView
end
    EOF
    assert_equal expected, @generator.context
  end
  
  test "check view_controller file context" do
    ARGV.replace %w(generate view_controller foo)
    expected = <<-EOF
# -*- coding: utf-8 -*-
class FooViewController < UIViewController
end
    EOF
    assert_equal expected, @generator.context
  end
  
  test "check table_view_controller file context" do
    ARGV.replace %w(generate table_view_controller foo)
    expected = <<-EOF
# -*- coding: utf-8 -*-
class FooTableViewController < UITableViewController
end
    EOF
    assert_equal expected, @generator.context
  end
  
  test "check navigation_controller file context" do
    ARGV.replace %w(generate navigation_controller foo)
    expected = <<-EOF
# -*- coding: utf-8 -*-
class FooNavigationController < UINavigationController
end
    EOF
    assert_equal expected, @generator.context
  end
  
  test "check tab_bar_controller file context" do
    ARGV.replace %w(generate tab_bar_controller foo)
    expected = <<-EOF
# -*- coding: utf-8 -*-
class FooTabBarController < UITabBarController
end
    EOF
    assert_equal expected, @generator.context
  end
  
  # --- spec context
  test "check model spec file context" do
    ARGV.replace %w(generate model foo)
    expected = <<-EOF
# -*- coding: utf-8 -*-
describe Foo do

  it "should be successful" do
    true.should == true
  end

end
    EOF
    assert_equal expected, @generator.spec_context
  end
  
  test "check view controller spec file context" do
    ARGV.replace %w(generate view_controller foo)
    expected = <<-EOF
# -*- coding: utf-8 -*-
describe FooViewController do

  it "should be successful" do
    true.should == true
  end

end
    EOF
    assert_equal expected, @generator.spec_context
  end
  
end

