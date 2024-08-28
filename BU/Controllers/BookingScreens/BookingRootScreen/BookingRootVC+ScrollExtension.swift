//
//  BookingRootVC+ScrollExtension.swift
//  BU
//
//  Created by Aman Kumar on 23/01/21.
//

import Foundation
import UIKit
extension BookingRootVC{
    //TODO: Back data implementation
    internal func backData(Index: Int) {
        animateScrollViewHorizontally(destinationPoint: CGPoint(x: 0 * self.view.frame.width, y: 0), andScrollView: self.scrollView, andAnimationMargin: 0)
    }
    
    
    //TODO: Animate scroll view horizontally
    internal func animateScrollViewHorizontally(destinationPoint destination: CGPoint, andScrollView scrollView: UIScrollView, andAnimationMargin margin: CGFloat) {
        var change: Int = 0;
        let diffx: CGFloat = destination.x - scrollView.contentOffset.x;
        var _: CGFloat = destination.y - scrollView.contentOffset.y;
        
        if(diffx < 0) {
            change = 1
        }
        else {
            change = 2
        }
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.3);
        UIView.setAnimationCurve(.easeIn);
        switch (change) {
        case 1:
            scrollView.contentOffset = CGPoint(x: destination.x - margin, y: destination.y);
        case 2:
            scrollView.contentOffset = CGPoint(x: destination.x + margin, y: destination.y);
        default:
            return;
        }
        UIView.commitAnimations();
        
        let firstDelay: Double  = 0.3;
        let startTime: DispatchTime = DispatchTime.now() + Double(Int64(firstDelay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        
        DispatchQueue.main.asyncAfter(deadline: startTime, execute: {
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationDuration(0.2);
            UIView.setAnimationCurve(.linear);
            switch (change) {
            case 1:
                scrollView.contentOffset = CGPoint(x: destination.x + margin, y: destination.y);
            case 2:
                scrollView.contentOffset = CGPoint(x: destination.x - margin, y: destination.y);
            default:
                return;
            }
            
            UIView.commitAnimations();
            let secondDelay: Double  = 0.2;
            let startTimeSecond: DispatchTime = DispatchTime.now() + Double(Int64(secondDelay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
            DispatchQueue.main.asyncAfter(deadline: startTimeSecond, execute: {
                UIView.beginAnimations(nil, context: nil)
                UIView.setAnimationDuration(0.1);
                UIView.setAnimationCurve(.easeInOut);
                scrollView.contentOffset = CGPoint(x: destination.x, y: destination.y);
                UIView.commitAnimations();
                
            })
        })
    }
    
    //TODO: Load scroll view horizontally
    
    internal func loadScrollView ()
    {
        print(self.children)
        for index in 0 ..< self.children.count
        {
            self.loadScrollViewWithPage(index);
        }
    }
    
    //TODO: Load scroll view with page horizontally
    internal func loadScrollViewWithPage(_ page : Int) -> Void
    {
        if(page < 0)
        {
            return
        }
        if page >= self.children.count
        {
            return
        }
        let viewController: UIViewController? = (self.children as NSArray).object(at: page) as? UIViewController
        if(viewController == nil)
        {
            return
        }
        if(viewController?.view.superview == nil){
            
            var frame: CGRect  = self.scrollView.frame
            frame.origin.x = self.view.frame.width*CGFloat(page)
            frame.origin.y = 0;
            viewController?.view.frame = frame;
            self.scrollView.addSubview(viewController!.view);
        }

        
            animateScrollViewHorizontally(destinationPoint: CGPoint(x: 0 * self.view.frame.width, y: 0), andScrollView: self.scrollView, andAnimationMargin: 0)
    
    }
    //TODO: Load scroll view with controller horizontally
    internal func loadScrollViewWithcontroller(upcomingBookings:BookingListViewModel,cancelledBookings:BookingListViewModel,completedBookings:BookingListViewModel) {
        self.scrollView.contentSize = CGSize(width: 3*self.view.frame.width,height: self.scrollView.frame.height);
        
        let UpcomingVC = self.storyboard?.instantiateViewController(withIdentifier: BookingUpcomingVC.className) as! BookingUpcomingVC
        UpcomingVC.upcoming_Bookings = upcomingBookings
        
        let DeleteVC = self.storyboard?.instantiateViewController(withIdentifier: BookingDeleteVC.className) as! BookingDeleteVC
        
        DeleteVC.cancelled_Bookings = cancelledBookings
        
        let CompletedVC = self.storyboard?.instantiateViewController(withIdentifier: BookingCompletedVC.className) as! BookingCompletedVC
        
        CompletedVC.completed_Bookings = completedBookings
        
        self.addChild(UpcomingVC)
        self.addChild(DeleteVC)
        self.addChild(CompletedVC)
        self.loadScrollView()
    }
    
}
