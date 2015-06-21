//
//  HomeView.swift
//  TinyGrip
//
//  Created by Javier Tarazaga on 20/06/15.
//  Copyright © 2015 typhoon. All rights reserved.
//

import Foundation
import MapKit

public class HomeView : UIView, Themeable {
    
    private var homeLabel : UILabel!
    
    public var root : Root? {
        willSet(root) {
            
            if (root != nil) {
                self.homeLabel.text = root!.previewAreas.href.absoluteString
            }
        }
    }
    
    public var theme : Theme! {
        willSet(theme) {
            dispatch_async(dispatch_get_main_queue()) {
                self.homeLabel.text = "Home"
            }
        }
    }
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Initialization & Destruction
    //-------------------------------------------------------------------------------------------
    public override init(frame : CGRect) {
        super.init(frame : frame)
        
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

        self.homeLabel.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        //self.homeLabel.frame = CGRectMake(0, 200, self.frame.size.width, 40)
    }
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Private Methods
    //-------------------------------------------------------------------------------------------
    private func initHomeLabel() {
        self.homeLabel = UILabel(frame: CGRectZero)
        self.homeLabel.font = UIFont.applicationFontOfSize(10)
//        self.homeLabel.textColor = UIColor(hexRGB: 0xf9f7f4)
        self.homeLabel.textColor = UIColor.yellowColor()
        self.homeLabel.backgroundColor = UIColor.clearColor()
        self.homeLabel.textAlignment = NSTextAlignment.Center
        self.addSubview(self.homeLabel)
    }
}