AMIT iOS development task
============
![Language](https://img.shields.io/badge/language-Swift%202-orange.svg)
![License](https://img.shields.io/badge/AMIT-First%20Task-green.svg)


# Required Task 
1) Get JSON data from URL
> - http://amit-learning.com/parkForMe/index.php
> - Display Parsed data into tableview
> - Save all information in Coredata
> - User can delete/edit information 

2) WRITE UNIT TESTS
> - Cover at least one class with unit tests

# How to build

1) Clone the repository
```bash
$ git clone https://github.com/digwey/https://github.com/digwey/AMIT_Task1.git
```

2) Install pods

```bash
$ cd FirstTask
$ pod install
```

3) Open the workspace in Xcode

```bash
$ open "FirstTask.xcworkspace"
```
4) Compile and run the app in your simulator or your iOS device

5) If you don't see any data, please check internet connection as the application doesn't check the connectivity status.


AMIT task is an iOS app developed in Swift 2. The app has been actively upgrading to adopt the latest features of iOS and Swift language.

# Notices
The current version is working with Xcode Version 7.3. If you are using different Xcode version, please check out the previous versions. 

# Screenshots
![Screenshot1]
(https://raw.githubusercontent.com/digwey/AMIT_Task1/master/screenshots/ScreenShot1.png)

![Screenshot2]
(https://raw.githubusercontent.com/digwey/AMIT_Task1/master/screenshots/ScreenShot2.png)

![Screenshot3]
(https://raw.githubusercontent.com/digwey/AMIT_Task1/master/screenshots/ScreenShot3.png)

![Screenshot4]
(https://raw.githubusercontent.com/digwey/AMIT_Task1/master/screenshots/ScreenShot4.png)

**Gif file using Xcode Emulator**
![Gif1]
(https://raw.githubusercontent.com/digwey/AMIT_Task1/master/screenshots/Amit_gif.gif)

# Unit testing
* Using XCTest
```bash
func testInitDataModel(){
//Generating Nil Item model
let itemModel = ItemModel(id: "0", langtitude: "Lan", latitude: "lat", userNumber: "UN", address: "Address", userFK: "UFK")


//It should be success because item Model with negative ID generate nil Model
XCTAssertNil(itemModel)

//Successfully generated Sector model
let itemModelSuccessed = ItemModel(id: "1", langtitude: "Lan", latitude: "lat", userNumber: "UN", address: "Address", userFK: "UFK")

//Test to insure mapping between model consturctor and model properties
XCTAssertEqual(itemModelSuccessed!.id,"1")
XCTAssertEqual(itemModelSuccessed!.langtitude,"Lan")
XCTAssertEqual(itemModelSuccessed!.latitude,"lat")
XCTAssertEqual(itemModelSuccessed!.userNumber,"UN")
XCTAssertEqual(itemModelSuccessed!.address,"Address")
XCTAssertEqual(itemModelSuccessed!.userFK,"UFK")
}

```

# Requirements

* Xcode 7
* iOS 9

