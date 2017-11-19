//
//  PAViewController.swift
//  Window
//
//  Created by Armin Hamar on 20.02.17.
//  Copyright © 2017 ProjektBlue. All rights reserved.
//

import AppKit
import SpriteKit

let AppName = "Window";
let beginSizeW = 800;
let beginSizeH = 600;

class PAViewController : NSObject , NSApplicationDelegate , NSWindowDelegate
{
    let window = NSWindow(contentRect: CGRect(x: 0,y: 0,width: beginSizeW,height: beginSizeH),
                          styleMask: [NSWindow.StyleMask.closable,
                                     NSWindow.StyleMask.miniaturizable,
                                     NSWindow.StyleMask.resizable,
                                     NSWindow.StyleMask.titled,
                                     NSWindow.StyleMask.fullSizeContentView],
                          backing: NSWindow.BackingStoreType.buffered,
                          defer: true,
                          screen: NSScreen.screens[0])
    
    let btnClose = NSWindow.ButtonType.closeButton;
    let mainMenu = NSMenu(title: AppName);
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        
        let InterfaceColorMode = UserDefaults.standard.string(forKey: "AppleInterfaceStyle") ?? "Light";
        if(InterfaceColorMode == "Dark")
        {
            /* Special Blend Effect
            let windowEffect          =    NSVisualEffectView()
            windowEffect.material     =    NSVisualEffectView.Material.dark
            windowEffect.blendingMode =    NSVisualEffectView.BlendingMode.behindWindow
            windowEffect.state        =    NSVisualEffectView.State.followsWindowActiveState
            windowEffect.needsDisplay =    true
            window.contentView        =    windowEffect
            window.invalidateShadow()
            window.setFrame(CGRect(x: 100, y: 100, width: beginSizeW, height: beginSizeH), display: false)
            */
            window.appearance = NSAppearance(named: NSAppearance.Name.vibrantDark)
        }
        
        window.isOpaque = false;
        window.center();
        window.acceptsMouseMovedEvents = true
        window.isReleasedWhenClosed = true
        window.makeKeyAndOrderFront(self)
        window.delegate = self;
        window.menu = mainMenu;
        window.title = AppName;
       
        
        let prefrenceMenuItem = NSMenuItem(title: "Application", action: nil, keyEquivalent: "")
        let prefrencePane = NSMenu();
        
        // Add Here an Additional Menu Item for your App
        // done with: prefrencePane.addItem(withTitle: "<Your Name>", action: #selector(<method>), keyEquivalent: "<shortcut>");
        prefrencePane.addItem(withTitle: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q");
        mainMenu.addItem(prefrenceMenuItem)
        prefrenceMenuItem.submenu = prefrencePane;
    }
    
    func windowShouldClose(_ sender: NSWindow) -> Bool {
        
        // do cleanup stuff here!
        
        NSApplication.shared.terminate(self);
        return true;
    }
    
    func applicationWillTerminate(_ notification: Notification) {
        //Nothing !
    }
    
}
