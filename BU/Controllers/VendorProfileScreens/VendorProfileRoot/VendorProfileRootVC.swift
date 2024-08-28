//
//  VendorProfileRootVC.swift
//  BU
//
//  Created by Aman Kumar on 21/01/21.
//

import UIKit
import DropDown

class VendorProfileRootVC: BaseViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnAboutRef: UIButton!
    @IBOutlet weak var btnReviewRef: UIButton!
    @IBOutlet weak var btnMessageRef: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    //MARK: - IBOutlets for skeleton
    @IBOutlet weak var imgProfile: UIImageView!
    
    @IBOutlet weak var viewPrice: UIView!
    @IBOutlet weak var imgPrice: UIImageView!
    @IBOutlet weak var lblPrice: UILabel!
    

    @IBOutlet weak var viewDistence: UIView!
    @IBOutlet weak var imgDistence:
        UIImageView!
    @IBOutlet weak var lblDistance: UILabel!

    
    @IBOutlet weak var viewRate: UIView!
    @IBOutlet weak var imgRate:
        UIImageView!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var viewLine: UIView!
    
    @IBOutlet weak var btnHireNowRef: UIButton!
    
    
    //MARK: - Variable
    internal var customMethodManager:CustomMethodProtocol?
    internal var info:ProviderViewModel?
    
    internal var profession:String = String()
    internal var headerTitle:String = String()
    internal var provider_id:String = String()
    internal var service_id:String = String()

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
                                self.btnAboutRef.titleLabel?.font = AppFont.SemiBold.size(AppFontName.Montserrat, size: 16)
                                self.btnAboutRef.setTitleColor(.black, for: .normal)
                                
                                
                                self.btnReviewRef.titleLabel?.font = AppFont.Medium.size(AppFontName.Montserrat, size: 16)
                                self.btnReviewRef.setTitleColor(.darkGray, for: .normal)

                                self.btnMessageRef.titleLabel?.font = AppFont.Medium.size(AppFontName.Montserrat, size: 16)
                                self.btnMessageRef.setTitleColor(.darkGray, for: .normal)

                            case 1:
                                self.btnAboutRef.titleLabel?.font = AppFont.Medium.size(AppFontName.Montserrat, size: 16)
                                self.btnAboutRef.setTitleColor(.darkGray, for: .normal)
                                
                                self.btnReviewRef.titleLabel?.font = AppFont.SemiBold.size(AppFontName.Montserrat, size: 16)
                                self.btnReviewRef.setTitleColor(.black, for: .normal)

                                
                                self.btnMessageRef.titleLabel?.font = AppFont.Medium.size(AppFontName.Montserrat, size: 16)
                                self.btnMessageRef.setTitleColor(.darkGray, for: .normal)

                            default:
                                self.btnAboutRef.titleLabel?.font = AppFont.Medium.size(AppFontName.Montserrat, size: 16)
                                self.btnAboutRef.setTitleColor(.darkGray, for: .normal)

                                
                                self.btnReviewRef.titleLabel?.font = AppFont.Medium.size(AppFontName.Montserrat, size: 16)
                                self.btnReviewRef.setTitleColor(.darkGray, for: .normal)

                                
                                self.btnMessageRef.titleLabel?.font = AppFont.SemiBold.size(AppFontName.Montserrat, size: 16)
                                self.btnMessageRef.setTitleColor(.black, for: .normal)

                            }
                        }
                       })
        
    }
    
    
   // hitUser_addressService()
    
    @IBAction func btnHireTapped(_ sender: UIButton) {
        self.hitUser_addressService()
    }
    
    
    
}
