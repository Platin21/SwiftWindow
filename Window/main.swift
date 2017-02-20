//
//  main.swift
//  Window
//
//  Created by Armin Hamar on 20.02.17.
//  Copyright © 2017 ProjektBlue. All rights reserved.
//

import AppKit

let myApp = NSApplication.shared()
let controller = PAViewController()

myApp.delegate = controller;
myApp.run()
