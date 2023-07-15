//
//  Dad_jokesApp.swift
//  Dad jokes
//
//  Created by Carmen Lucas on 15/7/23.
//

import SwiftUI

@main
struct Dad_jokesApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            JokeView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate{
    static private(set) var instance: AppDelegate!
    lazy var statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let menu = ApplicationMenu()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        AppDelegate.instance = self
        statusBarItem.button?.image = NSImage(named: NSImage.Name("CWC"))
        statusBarItem.button?.imagePosition = .imageLeading
        
        statusBarItem.menu = menu.createMenu()
        
    }
}
