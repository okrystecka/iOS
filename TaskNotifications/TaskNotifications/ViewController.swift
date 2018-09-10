//
//  ViewController.swift
//  TaskNotifications
//
//  Created by user1 on 19.07.2018.
//  Copyright © 2018 user1. All rights reserved.
//

import UIKit
import UserNotifications


class ViewController: UIViewController {
    
    @IBOutlet weak var Hello: UILabel!
    
    let center = UNUserNotificationCenter.current()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        center.requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in
            
        })
        
        
     //Optional
        center.getNotificationSettings { (settings) in
            if settings.authorizationStatus != .authorized {
                // Notifications not allowed
            }
        }
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10,
                                                        repeats: false)
        var reminderData = DateComponents()
        reminderData.hour = 12
        reminderData.minute = 0
        let triggerDaily = UNCalendarNotificationTrigger(dateMatching: reminderData, repeats: true)
        
//        let snoozeAction = UNNotificationAction(identifier: "Snooze",
//                                                title: "Snooze", options: [])
//        let deleteAction = UNNotificationAction(identifier: "UYLDeleteAction",
//                                                title: "Delete", options: [.destructive])
//
//        let category = UNNotificationCategory(identifier: "UYLReminderCategory",
//                                              actions: [snoozeAction,deleteAction],
//                                              intentIdentifiers: [], options: [])
//
//        center.setNotificationCategories([category])
        
        let content = UNMutableNotificationContent()
        content.title = NSLocalizedString("tester", comment: "")
        content.body = "A się wywołam co 3 minuty"
        content.sound = UNNotificationSound.default()
        
        let contentDailyNotif = UNMutableNotificationContent()
        contentDailyNotif.title = "Daily"
        contentDailyNotif.body = "Hi, "
        contentDailyNotif.sound = UNNotificationSound.default()
        
        let identifier = "UYLLocalNotification"
        let request = UNNotificationRequest(identifier: identifier,
                                            content: content, trigger: trigger)
        
        
        center.add(request, withCompletionHandler: { (error) in
            if error != nil {
                // Something went wrong
            }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

