class TestIbHeaderGenerator < Test::Unit::TestCase

  def setup
    @original_dir = File.expand_path Dir.pwd
    dst_dir = File.join @original_dir, "tmp"
    FileUtils.mkdir_p dst_dir
    Dir.chdir dst_dir
    `motion create sample`
    Dir.chdir "sample"
    IbHeaderGenerator.new.run
  end

  def teardown
    Dir.chdir @original_dir
    FileUtils.rm_rf File.join "tmp", "sample"
  end
  
  test "AppDelegate.h should be generated" do
    assert File.exist?("tmp/header/app/AppDelegate.h")
  end
  
  test "AppDelegate.h's context should be" do
    expected = <<-EOF
@interface AppDelegate : NSObject
@end
    EOF

    assert_equal expected, File.read("tmp/header/app/AppDelegate.h")
  end
  
end
