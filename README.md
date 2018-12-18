# SegueReusableViewHelper

A simple, protocol-oriented way, to deal with reusable views, segue handling and instantiation through storyboard ids without having loose literal strings throuout your code. 

This library is a mix of a few different ideas you might find in tutorials around the web, added together into a single, ready to use library.

## Installation

### Cocoapods

```ruby
pod 'SegueReusableViewHelper'
```

### Manually

This project has no dependencies, so, you can just download and add the swift files to your project if you want to.

## How to use it 

### - Segue Handling

Create an externsion to your view controller and adopt the SegueHandlerType protocol. Inside the extension create an enum called SegueIdentifer, type String, and add your segue names as cases.

```swift
extension MyViewController: SegueHandlerType {
    enum SegueIdentifier: String {
        case firstSegueName
        case secondSegueName
    }
}
```

Then, when you want to perform a segue, call the method like you always do, but instead of passing a literal string, pass the enum case.

```swift
    performSegue(withIdentifier: .firstSegueName, sender: self)
```

If you need to check for an identifier in prepare for segue, do it this way: 

```swift
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == SegueIdentifier.firstSegueName.rawValue {
                // Do what you need to.
            }
    }
```

Don't forget to add the enum case as an identifier to the segue on the storyboard

That's it, now you can handle segue identifiers in code without using literal strings or using a bunch of global constants and with access to auto-completion.

### - Storyboard ID instantiation Handling

Add an extension to the view controller that want to instantiate and adopt the StoryboardIDHandlerType protocol.

```swift
    extension SecondViewController: StoryboardIDHandlerType { }
```

On the view controller where you'll instantiate the second, do this:

```swift
    let secondController = storyboard?.instantiateViewController(withIdentifier: SecondViewController.storyboardID)
    present(secondController!, animated: true, completion: nil)
```

In the storyboard scene for the second controller, remember to add its name ("SecondViewController" in this case) as its Storyboard ID in the identity inspector.

### - ReusableView and NibLoadableView

They work with any view, but are specially useful for UITableViewCells or UICollectionViewCells. In this example, we'll cover how to use these protocols with a TableView Cell created using a standalone xib.

After creatng your cell on the xib, add an extension to the corresponding swift file and adopt the protocols:

```swift
    class MyTableViewCell: UITableViewCell {

        // IBOutlets...    
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

    }

    extension MyTableViewCell: ReusableView, NibLoadableView { }
```

On your view controller that has a Table View (or a UITableViewController), register your cell:

```swift
    tableView.register(MyTableViewCell.self)
```

Observation: If your are not using a xib and just want to register a class instead of a xib, adopt only the ReusableView protocol and use the same register method.

Then, on cellForRowAtIndexPath, dequeue it like this:

```swift
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MyTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        
        // Manipulate the cell

        return cell
    }
```

Don't forget to set the same name for your cell and your xib file ("MyTableViewCell.xib" and "MyTableViewCell.swift", in this example), also, on the xib, select the cell view, go to the attibutes inspector and add its name as the cell identifier.

