Motion Util
===

Convenient command set for Ruby Motion.

Installation
===

        gem install motion-util


Usage
===

### Generate class file.  

        motion-util generate model Foo  
        motion-util generate controller Foo  
        motion-util generate view Foo  
        motion-util generate view_controller Foo  
        motion-util generate table_view_controller Foo  
        motion-util generate navigation_controller Foo  
        motion-util generate tab_bar_controller Foo  

        You can also describe like this:  
        motion-util g model Foo  
        motion-util generation model Foo  

### Generate Objective-C header file for Interface Builder.
  
       motion-util ib_header

        You can also describe like this:  
        motion-util ibh  

        
Your ruby motion class:  

<pre>
# app_delegate.rb
class AppDelegate

  attr_accessor :window     # @type_info UIWindow
  attr_accessor :controller # @type_info UIViewController
  
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window.rootViewController = @controller
    @window.makeKeyAndVisible
    true
  end
  
  def showDialog sender    # IBAction
  end

end
</pre>

@type_info is a marker to describe a class by Objective-C.  
If it's not specified it will be id type.  
  
After execution 'motion-util ibh', AppDelegate.h was generated in tmp/header directory like this.  

<pre>
// AppDelegate.h
@interface AppDelegate : NSObject
@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (strong, nonatomic) IBOutlet UIViewController *controller;
- (IBAction)showDialog:(id)sender;
@end
</pre>


                  

Licence
===
BSD Licence
