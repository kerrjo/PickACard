//
//  ViewController.swift
//  PickACard
//
//  Created by JOSEPH KERR on 3/28/15.
//  Copyright (c) 2015 JOSEPH KERR. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var cardframe:CGRect?
    
    var backOfCardView:UIView?
    var frontOfCardView:UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        cardframe = self.view.frame

        backOfCardView = UIView (frame: cardframe!)
        backOfCardView!.layer.cornerRadius = 26
        backOfCardView?.clipsToBounds = true

        frontOfCardView = UIView (frame: cardframe!)
        frontOfCardView!.layer.cornerRadius = 26
        frontOfCardView?.clipsToBounds = true
        
        
        // Get the front image
        
//        if let aceOfHearts = UIImage( named:"Pick-A-Card-A-Hearts" )
//        {
//            let cardView:UIImageView = UIImageView (image:aceOfHearts)
//            cardView.frame = cardframe!;
//            
//            self.frontOfCardView!.addSubview(cardView)
//        }
        
        
//        if let kingOfSpaids = UIImage( named:"king-spades" )
//        {
//            let cardView:UIImageView = UIImageView (image:kingOfSpaids)
//            cardView.frame = cardframe!;
//            
//            self.frontOfCardView!.addSubview(cardView)
//        }

        
        if let kingOfSpaids = UIImage( named:"king-spades-clear" )
        {
            let cardView:UIImageView = UIImageView (image:kingOfSpaids)
            cardView.frame = cardframe!;
            cardView.backgroundColor = UIColor.lightGrayColor()
            self.frontOfCardView!.addSubview(cardView)
        }

        let blueBackOfCardPattern = UIImage( named:"riderback-pattern-blue" )
        let redBackOfCardPattern = UIImage( named:"riderback-pattern-red" )
        
        let backCardView:UIImageView = UIImageView (image:blueBackOfCardPattern)

        backCardView.frame = CGRectInset(backOfCardView!.frame, 16, 18)

        self.backOfCardView!.addSubview(backCardView)

        self.backOfCardView!.backgroundColor = UIColor.whiteColor()
        
        self.frontOfCardView!.hidden = true
        
        self.view.backgroundColor = UIColor.blackColor()

        self.view.addSubview(self.frontOfCardView!)
        self.view.addSubview(self.backOfCardView!)

    }
    
    //            let halfSize = backOfCards.size.width / 2
    //            var frame:CGRect = backCardView.frame
    //            frame.size = CGSizeMake(halfSize,backOfCards.size.height)
    //            backCardView.frame = cardframe!
    //        if let backOfCards = UIImage( named:"Bicycle Rider Backs" )
    //        {
    //            let backCardView:UIImageView = UIImageView (image:backOfCards)
    //
    //            let  doubleWide = self.backOfCardView!.frame.size.width * 2;
    //
    //            var frame:CGRect = backOfCardView!.frame
    //            frame.size.width = doubleWide;
    //            backCardView.frame = frame
    //
    //            let halfSize = backOfCardView!.frame.size.width
    //            var bounds:CGRect = self.backOfCardView!.bounds
    //            bounds.offset(dx: halfSize, dy: 0)
    //            backOfCardView!.bounds = bounds
    //
    //            self.backOfCardView!.addSubview(backCardView)
    //        }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        
        flipCardToRevealFront()
//        flipCardToFront()
//        flipCardToFrontShrink()

    }
    
    //

    

    //        CATransform3D scaleTransform = CATransform3DMakeScale(0.275, 0.275, 1.0);
    //        CGAffineTransform shrink = CATransform3DGetAffineTransform(scaleTransform);

    func flipCardToFrontShrink () {

        let scaleTransform = CATransform3DMakeScale(0.1575, 0.1575, 1.0);
        let shrink = CATransform3DGetAffineTransform(scaleTransform);
        
        let translateTransform = CATransform3DMakeTranslation(80, 0, 1.0)
        let move = CATransform3DGetAffineTransform(translateTransform);

//        let rotateTransform = CATransform3DMakeRotation( 240, 0.0, 0.0, 1.0)

        let rotateTransform = CATransform3DMakeRotation(320 * CGFloat(M_PI/180) , 0.0, 0.0, 1.0)

        
        let moveShrinkTransform = CATransform3DConcat(scaleTransform, translateTransform)
        let moveShrinkSpinTransform = CATransform3DConcat(moveShrinkTransform,rotateTransform)
        let shrinkSpinTransform = CATransform3DConcat(scaleTransform,rotateTransform)

//        UIViewAnimationOptions.TransitionFlipFromLeft |

        UIView.transitionWithView(self.view, duration: 1.12,
            options:[.Autoreverse,.Repeat,.TransitionFlipFromLeft],

//            options:
//                UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.Repeat | UIViewAnimationOptions.TransitionFlipFromLeft ,
            
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

    
    func flipCardToRevealFront () {
        
        let scaleTransform = CATransform3DMakeScale(0.3175, 0.3175, 1.0);
        let translateTransform = CATransform3DMakeTranslation(80, 0, 1.0)
        let rotateTransform = CATransform3DMakeRotation( 240, 0.0, 0.0, 1.0)
        
        let moveShrinkTransform = CATransform3DConcat(scaleTransform, translateTransform)
        let moveShrinkSpinTransform = CATransform3DConcat(moveShrinkTransform,rotateTransform)
        let shrinkSpinTransform = CATransform3DConcat(scaleTransform,rotateTransform)
        
        UIView.transitionWithView(self.view, duration: 1.12,
            options:[.Autoreverse,.Repeat,.TransitionCrossDissolve],
            
//            UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.Repeat | UIViewAnimationOptions.TransitionFlipFromLeft ,
            
            animations: {
                self.frontOfCardView!.hidden = false
                self.backOfCardView!.hidden = true
                self.view.transform =  CATransform3DGetAffineTransform(shrinkSpinTransform)
                //                self.backOfCardView!.transform =  move
                //                self.frontOfCardView!.transform =  shrink
            },
            completion: {
                (value: Bool) in
                if value {
                }
                
                self.frontOfCardView!.hidden = true
                self.backOfCardView!.hidden = false
                self.view.transform =  CGAffineTransformIdentity
                self.backOfCardView!.transform =  CGAffineTransformIdentity
                self.frontOfCardView!.transform =  CGAffineTransformIdentity
        })
    }

    

    //    options: .TransitionFlipFromLeft  ,

    func flipCardToFront () {
        
        UIView.transitionWithView(self.view, duration: 1.12,
            options:[.Autoreverse,.Repeat,.TransitionCrossDissolve],

//            options:
//            UIViewAnimationOptions.TransitionFlipFromLeft |
//                UIViewAnimationOptions.Autoreverse ,
            
            animations: {
                self.frontOfCardView!.hidden = false
                self.backOfCardView!.hidden = true
            },
            completion: {
                
                (fini: Bool) in
                if fini {
                    
                }
        })
    }

    func flipCardToBack ()   {
        
        UIView.animateWithDuration(1.0, delay: 1.5, options:
            .TransitionFlipFromLeft  ,
            animations: {
                self.frontOfCardView!.hidden = true
                self.backOfCardView!.hidden = false
                
            }, completion: nil)
        
    }

}




//class ViewController: UIViewController {
//    var testView : UIView!
//    
//    @IBAction func doButton1() {
//        let testView = UIView(frame: CGRectMake(200, 200, 100, 100))
//        testView.backgroundColor = UIColor.greenColor()
//        self.view.addSubview(testView)
//        self.testView = testView
//    }
//    @IBAction func doButton2() {
//        var transformAnim            = CAKeyframeAnimation(keyPath:"transform")
//        transformAnim.values         = [NSValue(CATransform3D: CATransform3DMakeRotation(3 * CGFloat(M_PI/180), 0, 0, -1)),
//            NSValue(CATransform3D: CATransform3DConcat(CATransform3DMakeScale(1.5, 1.5, 1), CATransform3DMakeRotation(3 * CGFloat(M_PI/180), 0, 0, 1))),
//            NSValue(CATransform3D: CATransform3DMakeScale(1.5, 1.5, 1)),
//            NSValue(CATransform3D: CATransform3DConcat(CATransform3DMakeScale(1.5, 1.5, 1), CATransform3DMakeRotation(-8 * CGFloat(M_PI/180), 0, 0, 1)))]
//        transformAnim.keyTimes       = [0, 0.349, 0.618, 1]
//        transformAnim.duration       = 1
//        self.testView.layer.addAnimation(transformAnim, forKey: "transform")
//    }
//}

