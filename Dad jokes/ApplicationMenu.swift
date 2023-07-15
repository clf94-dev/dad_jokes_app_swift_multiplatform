//
//  ApplicationMenu.swift
//  Dad jokes
//
//  Created by Carmen Lucas on 15/7/23.
//

import Foundation
import SwiftUI

class ApplicationMenu: NSObject {
    let menu = NSMenu()
    
    func createMenu() -> NSMenu {
        let jokeView = JokeView()
        let topView = NSHostingController(rootView: jokeView)
        topView.view.frame.size = CGSize(width: 225, height: 225)
        
        let customMenuItem = NSMenuItem()
        customMenuItem.view = topView.view
        menu.addItem(customMenuItem)
        menu.addItem(NSMenuItem.separator())
        
        let aboutMenuItem = NSMenuItem(title: "About Dad Jokes", action: #selector(about), keyEquivalent: "")
        aboutMenuItem.target = self
        menu.addItem(aboutMenuItem)
        

        return menu
        
    }
    @objc func about(sender: NSMenuItem){
        NSApp.orderFrontStandardAboutPanel()
    }
}
