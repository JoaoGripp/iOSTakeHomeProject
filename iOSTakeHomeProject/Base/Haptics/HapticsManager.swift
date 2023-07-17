//
//  HapticsManager.swift
//  iOSTakeHomeProject
//
//  Created by Joao Gripp on 17/07/23.
//

import Foundation
import UIKit

fileprivate final class HapticsManager {
    
    static let shared = HapticsManager()
    
    private let feedback = UINotificationFeedbackGenerator()
    
    private init() {}
    
    func trigger(_ notification: UINotificationFeedbackGenerator.FeedbackType) {
        feedback.notificationOccurred(notification)
    }
}

func haptic(_ notification: UINotificationFeedbackGenerator.FeedbackType) {
    if UserDefaults.standard.bool(forKey: UserDefaultKeys.hapticsEnable) {
        HapticsManager.shared.trigger(notification)
    }
    
}
