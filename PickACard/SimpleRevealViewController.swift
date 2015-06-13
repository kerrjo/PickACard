//
//  SimpleRevealViewController.swift
//  PickACard
//
//  Created by JOSEPH KERR on 3/31/15.
//  Copyright (c) 2015 JOSEPH KERR. All rights reserved.
//

import UIKit

class SimpleRevealViewController: UIViewController {

    var cardframe:CGRect?
    
    var backOfCardView:UIView?
    var frontOfCardView:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        cardframe = self.view.frame

        addCardViews();
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        flipCardToFrontShrink()
        
//        flipCardToRevealFront()
        //       flipCardToFront()

        
    }

    
    func addCardViews()
    {
        backOfCardView = UIView (frame: cardframe!)
        backOfCardView!.layer.cornerRadius = 26
        backOfCardView?.clipsToBounds = true
        
        frontOfCardView = UIView (frame: cardframe!)
        frontOfCardView!.layer.cornerRadius = 26
        frontOfCardView?.clipsToBounds = true
        
        
        // Get the front image
        if let aceOfHearts = UIImage( named:"Pick-A-Card-A-Hearts" )
        {
            let cardView:UIImageView = UIImageView (image:aceOfHearts)
            cardView.frame = cardframe!;
            
            self.frontOfCardView!.addSubview(cardView)
        }
        
        if let backOfCards = UIImage( named:"Bicycle Rider Backs" )
        {
            let backCardView:UIImageView = UIImageView (image:backOfCards)
            
            let  doubleWide = self.backOfCardView!.frame.size.width * 2;
            
            var frame:CGRect = backOfCardView!.frame
            frame.size.width = doubleWide;
            backCardView.frame = frame
            
            let halfSize = backOfCardView!.frame.size.width
            var bounds:CGRect = self.backOfCardView!.bounds
            bounds.offset(dx: halfSize, dy: 0)
            backOfCardView!.bounds = bounds
            
            self.backOfCardView!.addSubview(backCardView)
        }
        
        self.frontOfCardView!.hidden = true
        
        self.view.backgroundColor = UIColor.blackColor()

        
        self.view.addSubview(self.frontOfCardView!)
        self.view.addSubview(self.backOfCardView!)
        
    }
    
    //            let halfSize = backOfCards.size.width / 2
    //            var frame:CGRect = backCardView.frame
    //            frame.size = CGSizeMake(halfSize,backOfCards.size.height)
    //            backCardView.frame = cardframe!
    

    
    
    //        CATransform3D scaleTransform = CATransform3DMakeScale(0.275, 0.275, 1.0);
    //        CGAffineTransform shrink = CATransform3DGetAffineTransform(scaleTransform);
    
    func flipCardToFrontShrink () {
        
        let scaleTransform = CATransform3DMakeScale(0.3575, 0.3575, 1.0);
        let shrink = CATransform3DGetAffineTransform(scaleTransform);
        
        let translateTransform = CATransform3DMakeTranslation(80, 0, 1.0)
        let move = CATransform3DGetAffineTransform(translateTransform);
        
        let rotateTransform = CATransform3DMakeRotation( CGFloat(90.0 * M_PI / 180.0), 0.0, 0.0, 1.0)
        
        let moveShrinkTransform = CATransform3DConcat(scaleTransform, translateTransform)
        let moveShrinkSpinTransform = CATransform3DConcat(moveShrinkTransform,rotateTransform)
        let shrinkSpinTransform = CATransform3DConcat(scaleTransform,rotateTransform)
        
        
        
        UIView.animateWithDuration(2.0, delay: 0, options: UIViewAnimationOptions.Repeat, animations:{
            self.view.transform =  CATransform3DGetAffineTransform(shrinkSpinTransform)

            
            }, completion: { (value: Bool) in
                self.view.transform =  CGAffineTransformIdentity

            })
        
        
        //        UIViewAnimationOptions.TransitionFlipFromLeft |
        
//        UIView.transitionWithView(self.view, duration: 1.12, options:
//            UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.Repeat | UIViewAnimationOptions.TransitionFlipFromLeft ,
//            
//            animations: {
//                self.frontOfCardView!.hidden = false
//                self.backOfCardView!.hidden = true
//                self.view.transform =  CATransform3DGetAffineTransform(rotateTransform)
//                
//                //                self.backOfCardView!.transform =  move
//                //                self.frontOfCardView!.transform =  shrink
//                
//            },
//            completion: { (value: Bool) in
//                self.frontOfCardView!.hidden = true
//                self.backOfCardView!.hidden = false
//                self.view.transform =  CGAffineTransformIdentity
//                self.backOfCardView!.transform =  CGAffineTransformIdentity
//                self.frontOfCardView!.transform =  CGAffineTransformIdentity
//        })

    
    }
    
    
    func flipCardToRevealFront () {
        
        let scaleTransform = CATransform3DMakeScale(0.3175, 0.3175, 1.0);
        let translateTransform = CATransform3DMakeTranslation(80, 0, 1.0)
        let rotateTransform = CATransform3DMakeRotation( 240, 0.0, 0.0, 1.0)
        
        let moveShrinkTransform = CATransform3DConcat(scaleTransform, translateTransform)
        let moveShrinkSpinTransform = CATransform3DConcat(moveShrinkTransform,rotateTransform)
        let shrinkSpinTransform = CATransform3DConcat(scaleTransform,rotateTransform)
        
        UIView.transitionWithView(self.view, duration: 1.12, options:
            UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.Repeat | UIViewAnimationOptions.TransitionFlipFromLeft ,
            
            animations: {
                self.frontOfCardView!.hidden = false
                self.backOfCardView!.hidden = true
                self.view.transform =  CATransform3DGetAffineTransform(shrinkSpinTransform)
                //                self.backOfCardView!.transform =  move
                //                self.frontOfCardView!.transform =  shrink
            },
            completion: { (value: Bool) in
                self.frontOfCardView!.hidden = true
                self.backOfCardView!.hidden = false
                self.view.transform =  CGAffineTransformIdentity
                self.backOfCardView!.transform =  CGAffineTransformIdentity
                self.frontOfCardView!.transform =  CGAffineTransformIdentity
        })
    }
    
}

