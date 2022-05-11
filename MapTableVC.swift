//
//  MapTableVC.swift
//  grub_project
//
//  Created by Robin Cha, Lawrence Tran, Jomel Bautista, Vishal Muddaraj on 11/28/17.
//  Copyright © 2017 De Anza. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate, MKMapViewDelegate {
    

    @IBOutlet var grubMap: MKMapView!
    @IBOutlet var likedFoodsDetails: UITableView!
    @IBOutlet weak var newSearchButton: UIButton!
    
    var likedFoodResults: [FoodObjectMO] = []
    var locationManager = CLLocationManager()
    var hungryPersonPin = MKPointAnnotation()
    var displayPlacemark: CLPlacemark?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.newSearchButton.bringSubview(toFront: self.view)
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        newSearchButton.layer.cornerRadius = 3.0
        
//        let hungryPersonCoords = CLLocationCoordinate2DMake(37.319540, -122.045055)
//        hungryPersonPin.coordinate = hungryPersonCoords
//        hungryPersonPin.title = "IMHUNGRY"
//        grubMap.addAnnotation(hungryPersonPin)
        for foods in likedFoodResults {
            annotate(foodObject: foods)
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func newSearchButtonTouched(_ sender: UIButton) {
        performSegue(withIdentifier: "NewGrub", sender: nil)
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return likedFoodResults.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.backgroundColor = UIColor(named:"GrubRed")
        tableView.separatorStyle = .none
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LikedFoodTableCell", for: indexPath) as! LikedFoodTableCell
        let likedFood = likedFoodResults[indexPath.row]
        
        cell.restaurantNameLabel?.text = likedFood.iRestaurant
        cell.foodNameLabel?.text = likedFood.iName
        cell.addressLabel?.text = likedFood.iAddress
        cell.priceLabel?.text = likedFood.iPrice
        cell.foodImage?.image = UIImage(data: likedFood.iImage as! Data)
        cell.alpha = 0
        
        let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
        cell.layer.transform = transform
        UIView.animate(withDuration: 1.0){
            cell.alpha = 1.0
            
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func annotate(foodObject: FoodObjectMO) {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(foodObject.iAddress!, completionHandler: { (placemarks, error) in
            if error != nil {
                print(error!)
                return
            }
            if placemarks != nil && placemarks!.count > 0 {
                let placemark = placemarks![0] as CLPlacemark
                self.displayPlacemark = placemark
                //Add Annotation
                let annotation = MKPointAnnotation()
                annotation.title = foodObject.iRestaurant
                annotation.subtitle = foodObject.iName
                annotation.coordinate = placemark.location!.coordinate
                self.grubMap.addAnnotation(annotation)
            }
        })
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let span = MKCoordinateSpanMake(0.3, 0.3)
        let userLocation = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region = MKCoordinateRegionMake(userLocation, span)
        self.grubMap.setRegion(region, animated: true)
        self.grubMap.showsUserLocation = true
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

