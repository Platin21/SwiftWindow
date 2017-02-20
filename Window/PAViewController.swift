//
//  PAViewController.swift
//  Window
//
//  Created by Armin Hamar on 20.02.17.
//  Copyright © 2017 ProjektBlue. All rights reserved.
//

import AppKit
import SpriteKit

final class PAViewController : NSObject , NSApplicationDelegate , NSWindowDelegate
{
    let window = NSWindow()
    let view = PAView();
    let btnClose = NSWindowButton.closeButton;
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        
        window.setFrame(CGRect(x: 0,y: 0,width: 800,height: 600), display: true)
        window.contentView = view;
        window.isOpaque = false;
        window.center();
        window.styleMask = [.closable,.miniaturizable,.titled,.fullSizeContentView]
        window.acceptsMouseMovedEvents = true
        window.isReleasedWhenClosed = true
        window.makeKeyAndOrderFront(self)
        window.delegate = self;
        
        let sence = PASence(size: CGSize(width: 800, height: 600))
        
        view.presentScene(sence)
    }
    
    func windowShouldClose(_ sender: Any) -> Bool {
        NSApplication.shared().terminate(self);
        return true;
    }
    
    func applicationWillTerminate(_ notification: Notification) {
        //Nothing !
    }
    
}
