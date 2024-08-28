//
//  BookingRootVC.swift
//  BU
//
//  Created by Aman Kumar on 23/01/21.
//

import UIKit

class BookingRootVC: BaseViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var btnUpComingRef: UIButton!
    @IBOutlet weak var btnCanceledRef: UIButton!
    @IBOutlet weak var btnCompletedRef: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    //MARK: - Variables
    internal var customMethodManager:CustomMethodProtocol?
    internal var bookingVM:BookingDepenedencyInjection?
    
    
    //MARK: - View life cycle methods
    //TODO: Implementation viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.initValues()
    }
    
    //TODO: Implementation viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navSetup()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    //MARK: - Actions, Gestures, Selectors
    //TODO: Actions
    
    @IBAction func btnChoiceTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1,
                       animations: {
                        sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            sender.transform = CGAffineTransform.identity
                            // self.backData(Index: sender.tag)
                            
                            self.animateScrollViewHorizontally(destinationPoint: CGPoint(x: sender.tag * Int(self.view.frame.width), y: 0), andScrollView: self.scrollView, andAnimationMargin: 0)
                            
                            switch sender.tag {
                            case 0:
                                self.btnUpComingRef.titleLabel?.font = AppFont.SemiBold.size(AppFontName.Montserrat, size: 16)
                                self.btnUpComingRef.setTitleColor(.black, for: .normal)
                                
                                
                                self.btnCanceledRef.titleLabel?.font = AppFont.Medium.size(AppFontName.Montserrat, size: 16)
                                self.btnCanceledRef.setTitleColor(.darkGray, for: .normal)

                                self.btnCompletedRef.titleLabel?.font = AppFont.Medium.size(AppFontName.Montserrat, size: 16)
                                self.btnCompletedRef.setTitleColor(.darkGray, for: .normal)

                            case 1:
                                self.btnUpComingRef.titleLabel?.font = AppFont.Medium.size(AppFontName.Montserrat, size: 16)
                                self.btnUpComingRef.setTitleColor(.darkGray, for: .normal)
                                
                                self.btnCanceledRef.titleLabel?.font = AppFont.SemiBold.size(AppFontName.Montserrat, size: 16)
                                self.btnCanceledRef.setTitleColor(.black, for: .normal)

                                
                                self.btnCompletedRef.titleLabel?.font = AppFont.Medium.size(AppFontName.Montserrat, size: 16)
                                self.btnCompletedRef.setTitleColor(.darkGray, for: .normal)

                            default:
                                self.btnUpComingRef.titleLabel?.font = AppFont.Medium.size(AppFontName.Montserrat, size: 16)
                                self.btnUpComingRef.setTitleColor(.darkGray, for: .normal)

                                
                                self.btnCanceledRef.titleLabel?.font = AppFont.Medium.size(AppFontName.Montserrat, size: 16)
                                self.btnCanceledRef.setTitleColor(.darkGray, for: .normal)

                                
                                self.btnCompletedRef.titleLabel?.font = AppFont.SemiBold.size(AppFontName.Montserrat, size: 16)
                                self.btnCompletedRef.setTitleColor(.black, for: .normal)

                            }
                        }
                       })
        
    }
    
    
}
