//
//  StartScene.swift
//  GAME3004Assignment3
//
//  Created by Carlo Albino on 2017-03-17.
//  Copyright © 2017 Christopher Aytona. All rights reserved.
//

import SpriteKit
import GameplayKit
//import Accelerate

class StartScene: SKScene {
    private var Player1Start : Button?
    private var Player2Start : Button?
    private var Instructions1 : Button?
    private var Instructions2 : Button?
    private var Title: SKNode?
    
    var inst1Panel : SKSpriteNode?
    var inst2Panel : SKSpriteNode?
    
    private var mainMenu: MainMenu?
    
    override func didMove(to view: SKView) {
        mainMenu = MainMenu()
        
        Player1Start = (self.childNode(withName: "//Parent//Player1Start") as! Button)
        Player2Start = (self.childNode(withName: "//Parent//Player2Start") as! Button)
        Instructions1 = (self.childNode(withName: "//Parent//Instructions1") as! Button)
        Instructions2 = (self.childNode(withName: "//Parent//Instructions2") as! Button)
        
        Player1Start?.SetName("Player1Start")
        Player2Start?.SetName("Player2Start")
        Instructions1?.SetName("Instructions1")
        Instructions2?.SetName("Instructions2")
        
        mainMenu?.SetKey((Player1Start?.Attach(mainMenu!))!, Player1Start!)
        mainMenu?.SetKey((Player2Start?.Attach(mainMenu!))!, Player2Start!)
        mainMenu?.SetKey((Instructions1?.Attach(mainMenu!))!, Instructions1!)
        mainMenu?.SetKey((Instructions2?.Attach(mainMenu!))!, Instructions2!)
        
        inst1Panel  = (self.childNode(withName: "//Parent//Instructions1//InstructBubble1") as! SKSpriteNode)
        inst2Panel  = (self.childNode(withName: "//Parent//Instructions2//InstructBubble2") as! SKSpriteNode)
        
    
        
        inst1Panel?.centerRect = CGRect(x: 25.0/100.0, y: 25.0/100.0, width: 50.0/100.0, height: 50.0/100.0)
        inst2Panel?.centerRect = CGRect(x: 25.0/100.0, y: 25.0/100.0, width: 50.0/100.0, height: 50.0/100.0)
        
        mainMenu?.SetupMainMenu(self)
        
        Title = self.childNode(withName: "//Parent//Title")
        

    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        Title?.zRotation = (Title?.zRotation)! + CGFloat(currentTime * 0.000001)
        if((Title?.zRotation)! > CGFloat(M_PI * 2))
        {
            Title?.zRotation  = 0
        }

    }
}