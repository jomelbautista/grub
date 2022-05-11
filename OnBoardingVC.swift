//
//  OnBoardingVC.swift
//  grub_project
//
//  Created by Robin Cha, Lawrence Tran, Jomel Bautista, Vishal Muddaraj on 11/28/17.
//  Copyright © 2017 De Anza. All rights reserved.
//

import UIKit

class OnBoardingVC: UIViewController {
    

    @IBOutlet weak var beginButton: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBAction func beginButtonClicked(_ sender: UIButton) {
        UserDefaults.standard.set(true, forKey: "launchedBefore")
        performSegue(withIdentifier: "toPageVC", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.alpha = 0
        descriptionLabel.alpha = 0
        beginButton.alpha = 0
        backgroundImage.alpha = 0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1, animations: {
            self.backgroundImage.alpha = 0.8
        }) {(true) in
            self.showTitle()
        }
    }
    
    func showTitle () {
        UIView.animate(withDuration: 1, animations: {
            self.titleLabel.alpha = 1
        }, completion : {(true) in
            self.showDesc()
        })
    }
    
    func showDesc () {
        UIView.animate(withDuration: 1, animations: {
            self.descriptionLabel.alpha = 1
        }, completion : {(true) in
            self.showBeginButton()
        })
    }
    
    func showBeginButton () {
        UIView.animate(withDuration: 1, animations: {
            self.beginButton.alpha = 1
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
