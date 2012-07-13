# -*- coding: utf-8 -*-
class #{class_name}TableViewController < UITableViewController

=begin
  def initWithStyle style
    super
    self
  end
=end

=begin
  def viewDidLoad
    super
    # navigationItem.rightBarButtonItem = editButtonItem;
  end
=end

=begin
  def viewDidUnload
    super
  end
=end

=begin
  def viewWillAppear animated
    super
  end
=end

=begin  
  def viewWillDisappear animated
    super
  end
=end
  
=begin
  def shouldAutorotateToInterfaceOrientation interfaceOrientation
    interfaceOrientation == UIInterfaceOrientationPortrait
  end
=end


=begin
  def numberOfSectionsInTableView tableView
    1
  end
=end
  
=begin
  def tableView tableView, numberOfRowsInSection:section
    1
  end
=end

=begin
  CellIdentifier = "Cell"
  def tableView tableView, cellForRowAtIndexPath:indexPath
    cell = tableView.dequeueReusableCellWithIdentifier CellIdentifier
    cell ||= UITableViewCell.alloc.initWithStyle UITableViewCellStyleDefault, reuseIdentifier:CellIdentifier
    cell.textLabel.text = "Ruby Motion"
    cell
  end
=end

=begin
  def tableView tableView, canEditRowAtIndexPath:indexPath
    true
  end
=end
  
=begin
  def tableView tableView, commitEditingStyle:editingStyle, forRowAtIndexPath:indexPath
    case  editingStyle
    when UITableViewCellEditingStyleDelete
      tableView.deleteRowsAtIndexPaths [indexPath], withRowAnimation:UITableViewRowAnimationFade
    when UITableViewCellEditingStyleInsert
      # 
    end
  end
=end
  
=begin
  def tableView tableView, moveRowAtIndexPath:fromIndexPath, toIndexPath:toIndexPath
  end
=end
  
=begin
  def tableView tableView, canMoveRowAtIndexPath:indexPath
    true
  end
=end

end
