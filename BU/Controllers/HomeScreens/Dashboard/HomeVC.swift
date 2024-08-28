//
//  HomeVC.swift
//  BU
//
//  Created by Aman Kumar on 17/01/21.
//

import UIKit
import ViewAnimator
class HomeVC: BaseViewController {
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var draggableView: UIView!
    
    //MARK: - Variables
    internal var navigationTitle:String = String()
    internal var customMethodManager:CustomMethodProtocol?
    internal var validationMethodManager:ValidationProtocol?
    internal var homeVM: CategoryListModeling?
    internal var categoryListVM:CategoryListViewModel?
    internal let zoomAnimation = AnimationType.zoom(scale: 0.2)
    internal let rotateAnimation = AnimationType.rotate(angle: CGFloat.pi/6)
    
    
    internal weak var timer: Timer?
    internal var lati:String = String()
    internal var longi:String = String()
    
    //MARK: - View life cycle methods
    //TODO: Implementation viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initValues()
        
        
    }
    
    //TODO: Implementation viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navSetup()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.timer?.invalidate()
        self.timer = nil
    }
    
    //TODO: Implementation viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.animateView()
    }
    
    
    //MARK: - Actions, Gestures, Selectors
    //TODO: Actions
    
  /*  @IBAction func btnSearchTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1,
                       animations: {
                        self.searchBar.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            self.searchBar.transform = CGAffineTransform.identity
                            let vc = AppStoryboard.homeSB.instantiateViewController(withIdentifier: HomeSearchVC.className) as! HomeSearchVC
                            self.navigationController?.pushViewController(vc, animated: true)
                        }
                       })
        
    } */
    
    
    //TODO: Targets
    @objc func changeLabel()
     {
        if self.lblTitle.text == ConstantTexts.HowCanIHT{
            self.lblTitle.textAlignment = .center
            self.lblTitle.text = ConstantTexts.BUAPP_LT
        }else{
            self.lblTitle.textAlignment = .left
            self.lblTitle.text = ConstantTexts.HowCanIHT
        }
     }
    
    
    @objc func handler(gesture: UIPanGestureRecognizer){
            let location = gesture.location(in: self.view)
            let draggedView = gesture.view
            draggedView?.center = location
            
            if gesture.state == .ended {
                if self.draggableView.frame.midX >= self.view.layer.frame.width / 2 {
                    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                        self.draggableView.center.x = self.view.layer.frame.width - 40
                    }, completion: nil)
                }else{
                    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                        self.draggableView.center.x = 40
                    }, completion: nil)
                }
            }
        }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
