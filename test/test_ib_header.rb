# -*- coding: utf-8 -*-
require 'test-unit'
require 'motion-util'

=begin
class IbHeaderStub < IbHeader

  def source= source
    @source = source
  end
  
end
=end

include Motion::Util

class TestIbHeader < Test::Unit::TestCase

  def setup
    ARGV.replace %w(ib_header)
    @ib = IbHeader.new
  end
  
  
  # --- parse class/super
  test "class_name should be 'Foo' with 'class Foo'" do
    @ib.source = "class Foo"
    assert_equal ["Foo", nil], [@ib.class_name, @ib.super_name]
  end
  
  test "names should be ['Foo', 'Bar'] with 'class Foo < Bar'" do
    @ib.source = "class Foo < Bar"
    assert_equal %w(Foo Bar), [@ib.class_name, @ib.super_name]
  end
  
  test "names should be ['Foo', 'Bar'] with 'class Foo < Bar '" do
    @ib.source = "class Foo < Bar"
    assert_equal %w(Foo Bar), [@ib.class_name, @ib.super_name]
  end
  
  test "names should be ['Foo', 'Bar'] with 'class Foo<Bar'" do
    @ib.source = "class Foo < Bar"
    assert_equal %w(Foo Bar), [@ib.class_name, @ib.super_name]
  end
  
  
  # --- parse properties
  test "parse properties" do
    @ib.source = "attr_accessor :foo, :bar"
    assert_equal( { foo: { type: "id" }, bar: { type: "id"} }, @ib.properties )
  end
  
  test "parse readonly properties" do
    @ib.source = "attr_reader :foo, :bar"
    assert_equal( { foo: { type: "id", readonly: true }, bar: { type: "id", readonly: true} }, @ib.properties )
  end
  
  test "parse property with tyep_info string" do
    @ib.source = "attr_accessor :foo, :bar # @type_info String"
    assert_equal( { foo: { type: "NSString *" }, bar: { type: "NSString *"} }, @ib.properties )
  end
  
  test "context" do
    @ib.source = <<-EOF
class Foo
  attr_accessor :foo # no type
  attr_accessor :bar # @type_info UILabel
  attr_reader :hoge # @type_info UIView
end
    EOF
    
    expected = <<-EOF
@interface Foo : NSObject
@property (strong, nonatomic) id foo;
@property (strong, nonatomic) UILabel *bar;
@property (strong, nonatomic, readonly) UIView *hoge;
@end
    EOF
    
    assert_equal expected, @ib.context
  end
  
=begin
  test '' do
    assert_equal { foo: :id, bar: :id, hoge: :NSMutableString }, simple_source.properties }
    
  end
  

#=begin
    expected = <<-EOF
@interface Foo : Bar
@property (strong, nonatomic) id foo;
@property (strong, nonatomic) id bar;
@property (strong, nonatomic) NSMutableString hoge;
@end
    EOF
=end

end
