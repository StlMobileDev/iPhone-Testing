(function() {
 
 var target = UIATarget.localTarget(); 
 var window = UIATarget.localTarget().frontMostApp().mainWindow(); 
 
 window.buttons()["Reset"].tap();
 
 (function() {
  UIALogger.logStart("topRollValueGoesInTheTopRollTextField");
  
  window.buttons().firstWithName("Roll 1").tap(); // equivalent to window.buttons()["Roll 1"].tap()
  
  var roll1TextFieldValue = window.textFields()["Roll 1 Value"].value();
  var roll1TextFieldNumber = parseInt(roll1TextFieldValue);
  if ((1 <= roll1TextFieldNumber) && (roll1TextFieldNumber <= 6)) {
    UIALogger.logPass("topRollValueGoesInTheTopRollTextField");
  } else {
    UIALogger.logFail("topRollValueGoesInTheTopRollTextField unexpected value: " + roll1TextFieldValue);
  }
  })();
 })();
