# README #

iOS test assignment for ING bank

### What is this repository for? ###

Assignment:
1. Create an universal iOS App that shows a list of accounts.
2. There are two versions of this list that is displayed: complete list and the list of only visible
accounts. How you choose to display/switch between these two versions is entirely your own.
You can use the existing Bankieren app for inspiration.
3. You also want to be able to show this list in a different target like Apple Watch/Today's
Widget

### How do I get set up? ###

run "pod install"

### App characteristics: ###

- universal app
- switch between visible/invisible accounts
- used snapkit (all constraints are programatic -> no storyboards or xibs -> better for testing and for maintenance)
- implemented Unit Tests
- avoided Massive View Controllers
- implemented Apple Watch/Today widget but without scroll (Avoid putting a scroll view inside a Today widget. It’s difficult for users to scroll within a widget without inadvertently scrolling the Today view: https://developer.apple.com/library/content/documentation/General/Conceptual/ExtensibilityPG/Today.html)

### Who do I talk to? ###

vitorventurin@gmail.com