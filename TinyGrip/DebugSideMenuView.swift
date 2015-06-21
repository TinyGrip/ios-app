//
//  DebugDrawerView.swift
//  TinyGrip
//
//  Created by Javier Tarazaga on 21/06/15.
//  Copyright © 2015 typhoon. All rights reserved.
//

import UIKit

public class DebugSideMenuView : UIView {
    
    private var backgroundView : UIView!
    private var homeLabel : UILabel!
    
    public var root : Root? {
        willSet(root) {
            
            if (root != nil) {
                self.homeLabel.text = root!.previewAreas.href.absoluteString
            }
        }
    }
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Initialization & Destruction
    //-------------------------------------------------------------------------------------------
    
    public override init(frame : CGRect) {
        super.init(frame : frame)
        
        self.initBackgroundView()
        self.initHomeLabel()
    }
    
    public required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Overridden methods
    //-------------------------------------------------------------------------------------------
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundView.frame = CGRectInset(self.bounds, -10, -10)
        self.homeLabel.frame = CGRectMake(0, 40, self.frame.size.width, 40)
    }
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Private Methods
    //-------------------------------------------------------------------------------------------
    
    private func initBackgroundView() {
        self.backgroundView.backgroundColor = UIColor.clearColor()
        self.backgroundView = UIImageView(frame: CGRectZero)
        self.backgroundView.contentMode = UIViewContentMode.ScaleToFill
        self.backgroundView.parallaxIntensity = 20
        self.addSubview(self.backgroundView)
    }
    
    private func initHomeLabel() {
        self.homeLabel = UILabel(frame: CGRectZero)
        self.homeLabel.font = UIFont.applicationFontOfSize(10)
        self.homeLabel.textColor = UIColor(hexRGB: 0xf9f7f4)
        self.homeLabel.backgroundColor = UIColor.clearColor()
        self.homeLabel.textAlignment = NSTextAlignment.Center
        self.addSubview(self.homeLabel)
    }
  
}