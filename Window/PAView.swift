//
//  PAView.swift
//  Window
//
//  Created by Armin Hamar on 20.02.17.
//  Copyright © 2017 ProjektBlue. All rights reserved.
//

import AppKit
import SpriteKit

class PAView : SKView
{
    var text:String;
    
    override init(frame: NSRect)
    {
        text = "";
        super.init(frame: frame);
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not Implemented");
    }
    
    
    override func keyUp(with event: NSEvent) {
        let sence = self.scene as! PASence
        text += event.characters!
        sence.text = text
    }
    
    override func draw(_ dirtyRect: NSRect) {
        
    }
    
}

class PASence : SKScene
{
   var text = "";
    
    override func didMove(to view: SKView) {
        
        let lbl = SKLabelNode(text: text)
        lbl.position.x = 50
        lbl.position.y = 50
        lbl.color = .blue
        self.addChild(lbl)
    }
}

