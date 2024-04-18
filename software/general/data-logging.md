---
description: >-
  Recording data as the robot operates can be very helpful in troubleshooting and tuning an autonomous or driver control program.
---

# Data Logging

## To the Controller

Information can be displayed on the VEX controller. This can be ideal for quick checks of variable values. 

This method does have drawbacks. There are a limited number of characters on the controller screen and a 50 millisecond delay is required between print calls.

PROS C++ Example:
```cpp
controller.clear();
pros::delay(50);
controller.print(0, 0, "%s", "My message");
```
[Additional information on this example](https://pros.cs.purdue.edu/v5/api/cpp/misc.html#print)

## To a microSD Card

The VEX brain has a slot for a microSD card on the side. One way to record data is to create a text file on that microSD card, which can then be removed and inserted into a computer. If the computer does not have a microSD card slot, an adapter will be needed (such as a microSD to USB adapter).

PROS C++ Example:
```cpp
void createLogFile(){
    // creates a .txt log file for writing to
    logFile = fopen("/usd/log.txt".c_str(), "w");
}

void logToTxt(const std::string& message){
    // write a line of text to the log file
    fprintf(logFile, "%s\n", message.c_str());
}

void endTxtLogging(){
    // close and save the file
    fclose(logFile);
}
```

## To the Brain

Information can also be displayed on the brain using LVGL (Littlev Graphics Library). Version 5.3 of LVGL is included with PROS by default. Additional documentation can be found [here](https://github.com/GCEC-2918/LVGL_v5-3_Documentation_Archive). 

In the following example, an auto-scrolling log screen is created and used on the brain.
```cpp
void createTabView() {
    tabview = lv_tabview_create(lv_scr_act(), NULL);
	tab1 = lv_tabview_add_tab(tabview, "Log");
}

void logToBrain(const std::string& message) {
    static int next_y_pos = 20; // Track the Y position for the next message
    const int message_height = 20; // Adjust based on font size

    // Create the new label for the message
    lv_obj_t* lbl = lv_label_create(tab1, NULL);
    lv_label_set_text(lbl, message.c_str());
    lv_obj_set_pos(lbl, 0, next_y_pos);

    // Update the position for the next message
    next_y_pos += message_height;

    // Scroll to the bottom 
    // Sets the scroll position to -1000 pixels, and relies on it snapping back up to the lowest message. Not the most elegant way to do it.
    lv_page_scroll_ver(tab1, -1000);
}
```

#### Contributing Teams to this Article:

* [OSRC1](https://osurobotics.club/) (Dam Robotics)
