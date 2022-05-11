//
//  SwipeVC.swift
//  Gruub
//
//  Created by Robin Cha on 11/27/17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit
import CoreData

class SwipeVC: UIViewController {
    @IBOutlet var card: UIView!
    @IBOutlet var thumbImageView: UIImageView!
    @IBOutlet var navBar: UINavigationBar!
    @IBOutlet var doneButton: UIBarButtonItem!
    @IBOutlet var cancelButton: UIBarButtonItem!
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    var divisorPoint: CGFloat!
    
    var foodObjects: [FoodObjectMO] = []
    var likedFoods: [FoodObjectMO] = []
    var finishedLiking: Bool = false
    var categoryName : String!
    
    var swipeCards = [ImageCard]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        divisorPoint = (view.frame.width / 2) / 0.61
        
        randomizeCards()
        
        self.categoryNameLabel.text = self.categoryName
        categoryNameLabel.textColor = UIColor.white
        
        for foods in foodObjects {
            let newCard = ImageCard(frame: CGRect(x: 16, y: 140, width: 343, height: 391), iImage: UIImage(data: foods.iImage as! Data)!, iRestaurant: foods.iRestaurant!, iName: foods.iName!)
            swipeCards.append(newCard)
        }
        
            let firstCard = swipeCards[0]
            self.view.addSubview(firstCard)
            firstCard.addSubview(thumbImageView)
            firstCard.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panCardView)))
            firstCard.alpha = 1
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation

     //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowMapVC" {
            if finishedLiking == true {
                UIView.animate(withDuration: 2, animations: {})
                let mapVC = segue.destination as! MapTableVC
                    mapVC.likedFoodResults = likedFoods
            }
        }
    }
    
    @IBAction func panCardView(_ sender: UIPanGestureRecognizer) {
        guard let card = sender.view else { return }
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
        let cardSizeScale = min(100/abs(xFromCenter), 1)
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        card.transform = CGAffineTransform(rotationAngle: xFromCenter/divisorPoint).scaledBy(x: cardSizeScale, y: cardSizeScale)
        
        if xFromCenter > 0 {
            thumbImageView.image = #imageLiteral(resourceName: "ThumbsUp")
            thumbImageView.tintColor = UIColor.green
        }
        else {
            thumbImageView.image = #imageLiteral(resourceName: "ThumbsDown")
            thumbImageView.tintColor = UIColor.red
        }

        thumbImageView.alpha = abs(xFromCenter) / view.center.x
        if sender.state == UIGestureRecognizerState.ended {
            if card.center.x < 80 {
                //Move off to left
                UIView.animate (
                    withDuration: 0.3, animations: {
                        card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
                        card.alpha = 0
                    })
                showNextCard()
                checkLastCard()
                return
            }
            else if (card.center.x > (view.frame.width - 80)) {
                //Move off to right
                UIView.animate(
                    withDuration: 0.3, animations: {
                        card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
                        card.alpha = 0
                    })
                likedFoods.append(foodObjects[0])
//                showMapVC()
                showNextCard()
                checkLastCard()
                return
            }
            returnCard()
            
            UIView.animate (
                withDuration: 0.2, animations: {
                    card.center = self.view.center
                    self.thumbImageView.alpha = 0
            })
        }
    }
    
    func returnCard() {
        UIView.animate(
            withDuration: 0.3, animations: {
                self.swipeCards[0].center = self.view.center

                self.thumbImageView.alpha = 0
                self.swipeCards[0].alpha = 1
                self.swipeCards[0].transform = .identity
        })
    }
    
    func showNextCard() {
        //If there are still cards left, display the next one
        if swipeCards.count > 1  {
            foodObjects.remove(at: 0)
            swipeCards.remove(at: 0)
            thumbImageView.alpha = 0
            self.view.addSubview(swipeCards[0])
            swipeCards[0].alpha = 0
            swipeCards[0].addSubview(thumbImageView)
            
            UIView.animate(
                withDuration: 0.1,
                delay: 0.3,
                options: UIViewAnimationOptions.curveEaseIn,
                animations: {
                    self.swipeCards[0].alpha = 1
            },
                completion: nil
            )
            
            swipeCards[0].addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panCardView)))
        }
        else if swipeCards.count == 1 {
            foodObjects.remove(at: 0)
            swipeCards.remove(at: 0)
            finishedLiking = true
        }
    }
    
    func checkLastCard() {
        if (finishedLiking == true) {
            performSegue(withIdentifier: "ShowMapVC", sender: nil)
        }
    }
    
    func randomizeCards() {
        for i in 0 ..< (foodObjects.count - 1) {
            let j = Int(arc4random_uniform(UInt32(foodObjects.count - 1)))
            foodObjects.swapAt(i, j)
        }
    }
    

}
