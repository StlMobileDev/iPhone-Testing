(function() {
 
 var target = UIATarget.localTarget(); 
 var window = UIATarget.localTarget().frontMostApp().mainWindow(); 
 
 window.buttons()["Reset"].tap();
 
 (function() {
  UIALogger.logStart("resetInitiallyEnabled");
  
  if (window.buttons()["Reset"].isEnabled()) {
    UIALogger.logPass("resetInitiallyEnabled");
  } else {
    UIALogger.logFail("resetInitiallyEnabled: Reset should be enabled");
  }
  })();
 
 window.buttons()["Reset"].tap();
 
 (function() {
  UIALogger.logStart("resetEnabledAfterRoll1");
  
  window.buttons()["Roll 1"].tap();
  
  if (window.buttons()["Reset"].isEnabled()) {
    UIALogger.logPass("resetEnabledAfterRoll1");
  } else {
    UIALogger.logFail("resetEnabledAfterRoll1: Reset should be enabled");
  }
  })();
 
 window.buttons()["Reset"].tap();
 
 (function() {
  UIALogger.logStart("resetEnabledAfterRoll1AndRoll2");
  
  window.buttons()["Roll 1"].tap();
  window.buttons()["Roll 2"].tap();
  
  if (window.buttons()["Reset"].isEnabled()) {
    UIALogger.logPass("resetEnabledAfterRoll1AndRoll2");
  } else {
    UIALogger.logFail("resetEnabledAfterRoll1AndRoll2: Reset should be enabled");
  }
  })();
 
 window.buttons()["Reset"].tap();
 
 (function() {
  UIALogger.logStart("topRollButtonIsDisabledAfterFirstPress");
  
  window.buttons()["Roll 1"].tap();
  
  if (window.buttons()["Roll 1"].isEnabled()) {
    UIALogger.logFail("topRollButtonIsDisabledAfterFirstPress: Roll 1 button should be disabled");
  } else {
    UIALogger.logPass("topRollButtonIsDisabledAfterFirstPress");
  }
  })();
 
 window.buttons()["Reset"].tap();
 
 (function() {
  UIALogger.logStart("bottomRollButtonIsDisabledAfterFirstPress");
  
  window.buttons()["Roll 2"].tap();
  
  if (window.buttons()["Roll 2"].isEnabled()) {
    UIALogger.logFail("bottomRollButtonIsDisabledAfterFirstPress: Roll 2 button should be disabled");
  } else {
    UIALogger.logPass("bottomRollButtonIsDisabledAfterFirstPress");
  }
  })();
 
 window.buttons()["Reset"].tap();
 
 (function() {
  UIALogger.logStart("topAndBottomRollButtonsAreEnabledAfterTheyAreBothPressed");
  
  window.buttons()["Roll 1"].tap();
  window.buttons()["Roll 2"].tap();
  
  if (window.buttons()["Roll 1"].isEnabled() && window.buttons()["Roll 2"].isEnabled()) {
      UIALogger.logPass("topAndBottomRollButtonsAreEnabledAfterTheyAreBothPressed");
  } else {
      UIALogger.logFail("topAndBottomRollButtonsAreEnabledAfterTheyAreBothPressed: Roll 1 and Roll 2 buttons should be enabled");
  }
  })();
 
 window.buttons()["Reset"].tap();
 
 /*
 (function() {
  UIALogger.logStart("shouldFail");
  UIALogger.logFail("shouldFail");
  })();
 */ 
 
 })();