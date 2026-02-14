//
//  LocalNotificationTutorial.swift
//  SwiftUILearning
//
//  Created by Sarvesh Roshan on 14/02/26.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager {
    static let shared = NotificationManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error {
                print("Error: \(error)")
            } else {
                print("Success")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "This is first notification"
        content.subtitle = "This is subtitle for the notification"
        content.sound = .default
        content.badge = 1
        
        /**Time*/
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        /**Calendar*/
//        var dateComponents = DateComponents()
//        dateComponents.hour = 20
//        dateComponents.minute = 12
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        /**Location*/
        let coordinates = CLLocationCoordinate2D(latitude: 40.00, longitude: 50.00)
        let region = CLCircularRegion(center: coordinates, radius: 100, identifier: UUID().uuidString)
        region.notifyOnEntry = true
        region.notifyOnExit = false
        
        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

struct LocalNotificationTutorial: View {
    var body: some View {
        VStack(spacing: 30) {
            Button("Request permission") {
                NotificationManager.shared.requestAuthorization()
            }
            
            Button("Schedule notiification") {
                NotificationManager.shared.scheduleNotification()
            }
            
            Button("Cancel notiification") {
                NotificationManager.shared.cancelNotification()
            }
        }
        .onAppear {
//            UIApplication.shared.applicationIconBadgeNumber = 0
            Task {
                try? await UNUserNotificationCenter.current().setBadgeCount(0)
            }
        }
    }
}

#Preview {
    LocalNotificationTutorial()
}
