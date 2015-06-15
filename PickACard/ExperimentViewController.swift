//
//  ExperimentViewController.swift
//  PickACard
//
//  Created by JOSEPH KERR on 3/30/15.
//  Copyright (c) 2015 JOSEPH KERR. All rights reserved.
//

import UIKit


class ExperimentViewController: UIViewController {
    
    //    let cardframe = CGRectMake (0,0,754,1052)
    //    let cardframe = CGRectMake (0,0,370,600)
    var cardframe:CGRect?
    //joker
    
    // joker2
    
    //    cardframe = CGRectMake (0,0,754,1052)
    
    var backOfCardView:UIView?
    
    var frontOfCardView:UIView?
    
    //    var displayCardView = UIView (frame:CGRectMake (0,0,754,1052))
    
    //    var frontOfCardView:UIView
    
    //= UIView (frame: cardframe)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //        cardframe = CGRectMake (0,0,370,600)
        cardframe = self.view.frame
        
        backOfCardView = UIView (frame: cardframe!)
        frontOfCardView = UIView (frame: cardframe!)
        
        backOfCardView!.layer.cornerRadius = 26
        frontOfCardView!.layer.cornerRadius = 26
        
        frontOfCardView?.clipsToBounds = true
        backOfCardView?.clipsToBounds = true
        
        self.view.backgroundColor = UIColor.blackColor()
        
        if let aceOfHearts = UIImage( named:"Pick-A-Card-A-Hearts-990" )
        {
            let cardView:UIImageView = UIImageView (image:aceOfHearts)
            cardView.frame = cardframe!;
            self.frontOfCardView!.addSubview(cardView)
        }
        
        
        // Back of card
        
        //        self.backOfCard = [[UIView alloc] initWithFrame:self.view.frame];
        //
        //        CGFloat doubleWide = self.backOfCard.frame.size.width * 2;
        //
        //        CGRect frame = self.backOfCard.frame;
        //        frame.size.width = doubleWide;
        //
        //        cardbacks.frame = frame;
        //
        //        if (cardcolor==1)
        //        [self setRedbacks];
        //        else if (cardcolor==2)
        //        [self setBlueBacks];
        //
        //        _backOfCard.layer.cornerRadius = 26;
        //        _frontOfCard.layer.cornerRadius = 26;
        //
        //        _backOfCard.clipsToBounds = YES;
        //        _frontOfCard.clipsToBounds = YES;
        //
        //        //    _backOfCard.gestureRecognizers = self.view.gestureRecognizers;
        //
        //        [_backOfCard addSubview:cardbacks];
        //        self.view.backgroundColor = [UIColor blackColor];
        
        
        
        //        self.view.frame = cardframe
        var displayframe:CGRect = cardframe!
        
        if let backOfCards = UIImage( named:"Bicycle Rider Backs" )
        {
            let backCardView:UIImageView = UIImageView (image:backOfCards)
            
            let  doubleWide = self.backOfCardView!.frame.size.width * 2;
            
            var frame:CGRect = backOfCardView!.frame
            frame.size.width = doubleWide;
            backCardView.frame = frame
            
            let halfSize = backOfCardView!.frame.size.width / 2
            
            //            let halfSize = backOfCards.size.width / 2
            //            var frame:CGRect = backCardView.frame
            //            frame.size = CGSizeMake(halfSize,backOfCards.size.height)
            //            backCardView.frame = cardframe!
            
            //backCardView.contentMode =
            //backOfCardView = UIView (frame: frame)
            
            self.backOfCardView!.addSubview(backCardView)
            
            var bounds:CGRect = self.backOfCardView!.bounds
            
            
            //            bounds.offset(dx: halfSize, dy: 0)
            bounds.offset(dx: halfSize, dy: 0)
            
            //backOfCardView.bounds = bounds
            
        }
        
        self.frontOfCardView!.hidden = true
        
        self.view.addSubview(self.frontOfCardView!)
        self.view.addSubview(self.backOfCardView!)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        //flipCardToBack
        //displayCardView
        //        var displayframe:CGRect = cardframe
        //        self.view.frame = displayframe
        //        self.view.addSubview(displayCardView)
        
        flipCardToFront()
        
    }
    
    
    //    options: .TransitionFlipFromLeft  ,
    
    func flipCardToFront () {
        
        UIView.transitionWithView(self.view, duration: 1.12, options:
            UIViewAnimationOptions.TransitionFlipFromLeft |
                UIViewAnimationOptions.Autoreverse ,
            animations: {
                self.frontOfCardView!.hidden = false
                self.backOfCardView!.hidden = true
            },
            completion: {
                (value: Bool) in
                self.frontOfCardView!.hidden = true
                self.backOfCardView!.hidden = false
        })
    }
    
    
    
    //            duration:1.12
    //            options:UIViewAnimationOptionTransitionFlipFromLeft | UIViewAnimationOptionAutoreverse
    //            | UIViewAnimationOptionCurveEaseOut
    //
    //            animations:^{
    //            _backOfCard.hidden = YES;
    //            _frontOfCard.hidden = NO;
    //            //                        self.view.transform = shrink;
    //
    //
    //            }
    //            //                    completion:NULL];
    //
    //            completion:^(BOOL fini){
    //
    //            //                        if (fini)
    //            //                            [self setBlueBacks];
    //
    //            _backOfCard.hidden = NO;
    //            _frontOfCard.hidden = YES;
    //            self.view.transform = CGAffineTransformIdentity;
    //
    //
    //            }];
    
    
    
    //        UIView.animateWithDuration(3.0, delay: 1.5,
    //            options: .TransitionFlipFromLeft  ,
    //            animations: {
    ////                self.frontOfCardView!.hidden = false
    ////                self.backOfCardView!.hidden = true
    //
    //                self.view.addSubview(self.frontOfCardView!)
    //
    //                self.backOfCardView!.removeFromSuperview()
    //
    //            }, completion: nil)
    
    
    func flipCardToBack ()   {
        
        UIView.animateWithDuration(1.0, delay: 1.5, options:
            .TransitionFlipFromLeft  ,
            animations: {
                self.frontOfCardView!.hidden = true
                self.backOfCardView!.hidden = false
                
            }, completion: nil)
        
    }
    
}


//    UIView.animateWithDuration(1.0, delay: 0.0, options:
//        .TransitionFlipFromLeft | .Repeat ,
//        animations: {
//
//            frontOfCardView.hidden = true
//            backOfCardView.hidden = false
//
//        }, completion: {
//            (value: Bool) in
//
//            UIView.animateWithDuration(1.0, delay: 0.5, options:
//                .TransitionFlipFromLeft ,
//                animations: {
//
//                    frontOfCardView.hidden = true
//                    backOfCardView.hidden = false
//
//                }, completion: nil )
//            //                    (value: Bool) in
//            //                    backOfCardView.hidden = true
////            backOfCardView.hidden = true
//
//    })


