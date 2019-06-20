//
//  ApperanceHelper.swift
//  Tasks
//
//  Created by Enayatullah Naseri on 6/19/19.
//  Copyright © 2019 Andrew R Madsen. All rights reserved.
//

import UIKit

enum ApperanceHelper {
    
    static var midPurple = UIColor(red: 154.0/255.0, green: 120.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    static var backgroundGray = UIColor(red: 77.0/255.0, green: 77.0/255.0, blue: 77.0/255.0, alpha: 1.0)
    static var lightPurple = UIColor(red: 202.0/255.0, green: 172.0/255.0, blue: 249.0/255.0, alpha: 1.0)
    
    static func typerighterFont(with textStyle: UIFont.TextStyle, pointSize: CGFloat) -> UIFont {
        
        let font = UIFont(name: "Zapfino", size: pointSize)!
        return UIFontMetrics(forTextStyle: textStyle).scaledFont(for: font)
        
    }
    
    
    static func setDarkApperance() {
        
        UINavigationBar.appearance().barTintColor = backgroundGray
        UISegmentedControl.appearance().tintColor = midPurple
        UIBarButtonItem.appearance().tintColor = midPurple
        
        UITextView.appearance().tintColor = lightPurple
        UITextView.appearance().tintColor = lightPurple
        
        let textAttributes = [NSAttributedString.Key.foregroundColor : lightPurple]
        
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        UINavigationBar.appearance().largeTitleTextAttributes = textAttributes
        
    }
    
    
    static func style(button: UIButton) {
        
        button.titleLabel?.font = typerighterFont(with: .callout, pointSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = self.midPurple
//        button.layer.cornerRadius = 6
        
    }
}
