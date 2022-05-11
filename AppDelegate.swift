//
//  AppDelegate.swift
//  grub_project
//
//  Created by Robin Cha, Lawrence Tran, Jomel Bautista, Vishal Muddaraj on 11/28/17.
//
//  Copyright © 2017 De Anza. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var grubFoods = [
        FoodObject(iName: "Pastrami Melt", iRestaurant: "1 St Food", iAddress: "SoFa Market, San Jose, CA 95113", iCategory: "American", iPrice: "$", iDistance: "", iImage: #imageLiteral(resourceName: "1StFood_PastramiMeltBurger")),
        FoodObject(iName: "Bistro Burger", iRestaurant: "1621 Bistro", iAddress: "1621 N Capitol Ave, San Jose, 95132", iCategory: "American", iPrice: "$$", iDistance: "", iImage: #imageLiteral(resourceName: "1621Bistro_BistroBurger")),
        FoodObject(iName: "American Burger", iRestaurant: "1621 Bistro", iAddress: "1621 N Capitol Ave, San Jose, CA 95132", iCategory: "American", iPrice: "$$", iDistance: "", iImage: #imageLiteral(resourceName: "1621Bistro_TheAmericanBurger")),
        FoodObject(iName: "Bison Burger", iRestaurant: "Sliders Burgers", iAddress: "1645 W San Carlos St., San Jose, CA 95128", iCategory: "American", iPrice: "$", iDistance: "", iImage: #imageLiteral(resourceName: "SlidersBurgers_BisonBurger")),
        FoodObject(iName: "Wild Boar Burger", iRestaurant: "Sliders Burgers", iAddress: "1645 W San Carlos St., San Jose, CA 95128", iCategory: "American", iPrice: "$", iDistance: "", iImage: #imageLiteral(resourceName: "SlidersBurgers_WildBoarBurgers")),
        FoodObject(iName: "El Asado Burger", iRestaurant: "The Counter", iAddress: "20080 Stevens Creek Blvd., Cupertino, CA 95014", iCategory: "American", iPrice: "$$", iDistance: "", iImage: #imageLiteral(resourceName: "TheCounter_ElAsadoBurger")),
        FoodObject(iName: "Impossible Burger", iRestaurant: "The Counter", iAddress: "20080 Stevens Creek Blvd., Cupertino, CA 95014", iCategory: "American", iPrice: "$$", iDistance: "", iImage: #imageLiteral(resourceName: "TheCounter_ImpossibleBurger")),
        FoodObject(iName: "Pokemonnom Burger", iRestaurant: "Nom Burger", iAddress: "251 W Washington Ave, Sunnyvale, CA 94086", iCategory: "American", iPrice: "$$", iDistance: "", iImage: #imageLiteral(resourceName: "NomBurger_PokemonnomBurger")),
        FoodObject(iName: "California Love Burger", iRestaurant: "Nom Burger", iAddress: "251 W Washington Ave, Sunnyvale, CA 94086", iCategory: "American", iPrice: "$$", iDistance: "", iImage: #imageLiteral(resourceName: "NomBurger_CaliforniaLoveBurger")),
        FoodObject(iName: "California Burger", iRestaurant: "Main Street Burgers", iAddress: "1100 Lincoln Ave, San Jose, CA 95125", iCategory: "American", iPrice:  "$$", iDistance: "", iImage: #imageLiteral(resourceName: "MainStreetBurgers_CaliforniaBurger")),
        FoodObject(iName: "Bacon Blue Burger", iRestaurant: "Main Street Burgers", iAddress: "1100 Lincoln Ave, San Jose, CA 95125", iCategory: "American", iPrice:  "$$", iDistance: "", iImage: #imageLiteral(resourceName: "MainStreetBurgers_BaconBleuBurger")),
        FoodObject(iName: "Double Cheeseburger", iRestaurant: "Master Burger & Grill", iAddress: "1411 Bird Ave., San Jose, CA 95125", iCategory: "American", iPrice:  "$", iDistance: "", iImage: #imageLiteral(resourceName: "MasterBurger_Grill_DoubleCheeseburger")),
        FoodObject(iName: "Mega Juicy Burger", iRestaurant: "Juicy Burger", iAddress: "630 Blossom Hill Rd., San Jose, CA 95123", iCategory: "American", iPrice:  "$", iDistance: "", iImage: #imageLiteral(resourceName: "JuicyBurger_MegaJuicyBurger")),
        FoodObject(iName: "Super Juicy Burger", iRestaurant: "Juicy Burger", iAddress: "630 Blossom Hill Rd., San Jose, CA 95123", iCategory: "American", iPrice:  "$", iDistance: "", iImage: #imageLiteral(resourceName: "JuicyBurger_SuperJuicyBurger")),
        FoodObject(iName: "Bacon Cheeseburger", iRestaurant: "King's Burger House", iAddress: "980 S King Rd., San Jose, CA 95116", iCategory: "American", iPrice:  "$", iDistance: "", iImage: #imageLiteral(resourceName: "King_sBurgerHouse_BaconCheeseburger")),
        FoodObject(iName: "Double Combo", iRestaurant: "King's Burger House", iAddress: "980 S King Rd., San Jose, CA 95116", iCategory: "American", iPrice: "$", iDistance: "", iImage: #imageLiteral(resourceName: "King_sBurgerHouse_DoubleCombo")),
        FoodObject(iName: "Konjoe Burger", iRestaurant: "Konjoe Burger", iAddress: "100 N Almaden Ave., Ste 180, San Jose, CA 95110", iCategory: "American", iPrice:  "$$", iDistance: "", iImage: #imageLiteral(resourceName: "KonjoeBurger_KonjoeBurger")),
        FoodObject(iName: "Fried Chicken", iRestaurant: "99 Chicken", iAddress: "2781 El Camino Real, Santa Clara, CA 95051", iCategory: "Korean", iPrice:  "$$", iDistance: "", iImage: #imageLiteral(resourceName: "99Chicken_FriedChicken")),
        FoodObject(iName: "Sauce Chicken", iRestaurant: " 99 Chicken", iAddress: "2781 El Camino Real, Santa Clara, CA 95051", iCategory: "Korean", iPrice:  "$$", iDistance: "", iImage: #imageLiteral(resourceName: "99Chicken_SauceChicken")),
        FoodObject(iName: "Chicken Skins", iRestaurant: "Ajito", iAddress: "7335 Bollinger Rd., Cupertino, CA 95014", iCategory: "Japanese", iPrice:  "$$", iDistance: "", iImage: #imageLiteral(resourceName: "Ajito_ChickenSkins")),
        FoodObject(iName: "Chicken Thigh", iRestaurant: "Ajito", iAddress: "7335 Bollinger Rd., Cupertino, CA 95014", iCategory: "Japanese", iPrice:  "$$", iDistance: "", iImage: #imageLiteral(resourceName: "Ajito_ChickenThigh")),
        FoodObject(iName: "Chicken Wings Habanero", iRestaurant: "Blurr Kithen", iAddress: "2374 El Camino Real, Santa Clara, CA 95050", iCategory: "Vietnamese", iPrice:  "$$", iDistance: "", iImage: #imageLiteral(resourceName: "BlurrKitchen_ChickenWingsHabanero")),
        FoodObject(iName: "Fiery Glazed Chicken Wings", iRestaurant: "Blurr Kitchen", iAddress: "2374 El Camino Real, Santa Clara, CA 95050", iCategory: "Vietnamese", iPrice:  "$$", iDistance: "", iImage: #imageLiteral(resourceName: "BlurrKitchen_FieryGlazedChickenWings")),
        FoodObject(iName: "Fried Chicken Wings", iRestaurant: "BN Chicken", iAddress: "2725 El Camino Real, Santa Clara, CA 95051", iCategory: "Korean", iPrice:  "$$", iDistance: "", iImage: #imageLiteral(resourceName: "BNChicken_FriedChickenWings")),
        FoodObject(iName: "Traditional Korean Chicken Soup", iRestaurant: "BN Chicken", iAddress: "2725 El Camino Real, Santa Clara, CA 95051", iCategory: "Korean", iPrice:  "$$", iDistance: "", iImage: #imageLiteral(resourceName: "BNChicken_TraditionalKoreanChickenSoup")),
        FoodObject(iName: "Tofu Chicken Salad", iRestaurant: "Bon Chon Chicken", iAddress: "572 El Camino Real, Sunnyvale, CA 94087", iCategory: "Korean", iPrice:  "$$", iDistance: "", iImage: #imageLiteral(resourceName: "BonChonChicken_TofuChickenSalad")),
        FoodObject(iName: "Wings & Drumsticks", iRestaurant: "Bon Chon Chicken", iAddress: "572 El Camino Real, Sunnyvale, CA 94087", iCategory: "Korean", iPrice:  "$$", iDistance: "", iImage: #imageLiteral(resourceName: "BonChonChicken_Wings_Drumstick")),
        FoodObject(iName: "Original Fried Chicken", iRestaurant: "ChiMek", iAddress: "3597 Homestead Rd., Santa Clara, CA 95051", iCategory: "Korean", iPrice:  "$$", iDistance: "", iImage: #imageLiteral(resourceName: "ChiMek_OriginalFriedChicken")),
        FoodObject(iName: "Soy Garlic Fried Chicken", iRestaurant: "ChiMek", iAddress: "3597 Homestead Rd., Santa Clara, CA 95051", iCategory: "Korean", iPrice:  "$$", iDistance: "", iImage: #imageLiteral(resourceName: "ChiMek_SoyGarlicFriedChicken")),
        FoodObject(iName: "Crispy Fried Chicken", iRestaurant: "Von's Chicken", iAddress: "1082 E El Camino Rd., Sunnyvale, CA 94087", iCategory: "American", iPrice:  "$$", iDistance: "", iImage: #imageLiteral(resourceName: "VonsChicken_CrispyFriedChicken")),
        FoodObject(iName: "Von's Special Sauce Chicken", iRestaurant: "Von's Chicken", iAddress: "1082 E El Camino Rd., Sunnyvale, CA 94087", iCategory: "American", iPrice:  "$$", iDistance: "", iImage: #imageLiteral(resourceName: "VonsChicken_VonsSpecialSauceChicken")),
        FoodObject(iName: "Chicken & Waffle Bites", iRestaurant: "The Waffle Roost", iAddress: "Sunnyvale, CA 94086", iCategory: "American",  iPrice: "$", iDistance: "", iImage: #imageLiteral(resourceName: "TheWaffleRoost_Chicken_WaffleBites")),
        FoodObject(iName: "Spicy Chicken Waffle Sandwich", iRestaurant: "The Waffle Roost", iAddress: "Sunnyvale, CA 94086", iCategory: "American",  iPrice: "$", iDistance: "", iImage: #imageLiteral(resourceName: "TheWaffleRoost_SpicyChickenWaffleSandwhich")),
        FoodObject(iName: "Spicy Chicken Cashew Nut", iRestaurant: "Thai Bangkok Cuisine", iAddress: "21670 Stevens Creek Blvd, Cupertino, CA 95014", iCategory: "Thai", iPrice: "$$", iDistance: "", iImage: #imageLiteral(resourceName: "ThaiBangkokCuisine_SpicyChickenCashewNut")),
        FoodObject(iName: "Spicy Chicken Sam Ros", iRestaurant: "Thai Bangkok Cuisine", iAddress: "21671 Stevens Creek Blvd., Cupertino, CA 95014", iCategory: "Thai", iPrice: "$$", iDistance: "", iImage: #imageLiteral(resourceName: "ThaiBangkokCuisine_SpicyChickenSamRos")),
        FoodObject(iName: "Chicken & Egg", iRestaurant: "Starbird",  iAddress: "1088 E Brokaw Rd., San Jose, CA 95131", iCategory: "American", iPrice: "$$", iDistance: "", iImage: #imageLiteral(resourceName: "StarBird_Chicken_Egg")),
        FoodObject(iName: "Southern Belle", iRestaurant: "Starbird", iAddress: "1088 E Brokaw Rd., San Jose, CA 95131", iCategory: "American", iPrice: "$$", iDistance: "", iImage: #imageLiteral(resourceName: "StarBird_SoutherBelle")),
        FoodObject(iName: "24 oz T-bone Steak", iRestaurant: "Alexander's Steakhouse", iAddress: "19397 Stevens Creek Blvd., Cupertino, CA 95014", iCategory: "Steakhouse", iPrice: "$$$$", iDistance: "", iImage: #imageLiteral(resourceName: "AlexandersSteakhouse_24ozTboneSteak")),
        FoodObject(iName: "Rib Eye Steak", iRestaurant: "Alexander's Steakhouse", iAddress: "19397 Stevens Creek Blvd., Cupertino, CA 95014", iCategory: "Steakhouse", iPrice: "$$$$", iDistance: "", iImage: #imageLiteral(resourceName: "AlexandersSteakhouse_RibEyeSteak")),
        FoodObject(iName: "Dry Aged Rib Eye", iRestaurant: "Fleming's Prime Steakhouse", iAddress: "2762 Augustine Dr., Santa Clara, CA 95054", iCategory: "Steakhouse", iPrice: "$$$$", iDistance: "", iImage: #imageLiteral(resourceName: "FlemingsPrimeSteakhouse_DryAgedRibEye")),
        FoodObject(iName: "Prime Dry Age NY Strip", iRestaurant: "Fleming's Prime Steakhouse", iAddress: "2762 Augustine Dr., Santa Clara, CA 95054", iCategory: "Steakhouse", iPrice: "$$$$", iDistance: "", iImage: #imageLiteral(resourceName: "FlemingsPrimeSteakhouse_PrimeDryAgedNYStrip")),
        FoodObject(iName: "Beef Ancho Rib Eye", iRestaurant: "Fogo De Chao", iAddress: "377 Santan Row,San Jose, CA 95128", iCategory: "Steakhouse", iPrice: "$$$", iDistance: "", iImage: #imageLiteral(resourceName: "FogoDeChao_BeefAnchoRibEye")),
        FoodObject(iName: "Bone-In Cowboy Rib-Eye", iRestaurant: "Fogo De Chao", iAddress: "377 Santana Row,San Jose, CA 95128", iCategory: "Steakhouse", iPrice: "$$$", iDistance: "", iImage: #imageLiteral(resourceName: "FogoDeChao_Bone-inCowboyRibeye")),
        FoodObject(iName: "Wagyu & Gold Flakes", iRestaurant: "Hiroshi", iAddress: "328 Main St., Los Altos, CA 94022", iCategory: "Steakhouse", iPrice: "$$$$", iDistance: "", iImage: #imageLiteral(resourceName: "Hiroshi_Wagyu_GoldFlakes")),
        FoodObject(iName: "Yakiniku Steak", iRestaurant: "Hiroshi", iAddress: "328 Main St., Los Altos, CA 94022", iCategory: "Steakhouse", iPrice: "$$$$", iDistance: "", iImage: #imageLiteral(resourceName: "Hiroshi_YakinikuSteak")),
        FoodObject(iName: "Baby Back Ribs", iRestaurant: "Lazy Dog Restaurant & Bar", iAddress: "19359 Stevens Creek Blvd., Cupertino, CA 95014", iCategory: "American", iPrice: "$$", iDistance: "", iImage: #imageLiteral(resourceName: "LazyDogRestaurant_Bar_BabyBackRibs")),
        FoodObject(iName: "Hawaiian Sticky Ribs", iRestaurant: "Lazy Dog Restaurant & Bar", iAddress: "19359 Stevens Creek Blvd., Cupertino, CA 95014", iCategory: "American", iPrice: "$$", iDistance: "", iImage: #imageLiteral(resourceName: "LazyDogRestaurant_Bar_HawaiinStickyRibs")),
        FoodObject(iName: "Beef Tenderloin", iRestaurant: "Le Papillon", iAddress:"410 Saratoga Ave., San Jose, CA 95129", iCategory: "Steakhouse", iPrice: "$$$$", iDistance: "", iImage: #imageLiteral(resourceName: "LePapillon_BeefTenderloin")),
        FoodObject(iName: "Red Deer Steak", iRestaurant: "Le Papillon", iAddress: "410 Saratoga Ave., San Jose, CA 95129", iCategory: "Steakhouse", iPrice: "$$$$", iDistance: "", iImage: #imageLiteral(resourceName: "LePapillon_RedDeerSteak")),
        FoodObject(iName: "Filet Mignon", iRestaurant: "Rok Bistro", iAddress: "124 S Murphy Ave., Sunnyvale, CA 94086", iCategory: "Steakhouse", iPrice: "$$$", iDistance: "", iImage: #imageLiteral(resourceName: "RokBistro_FiletMignon")),
        FoodObject(iName: "New York Strip", iRestaurant: "Rok Bistro", iAddress: "124 S Murphy Ave., Sunnyvale, CA 94086", iCategory: "Steakhouse", iPrice: "$$$", iDistance: "", iImage: #imageLiteral(resourceName: "RokBistro_NewYorkStrip")),
        FoodObject(iName: "Bone-In Rib Eye", iRestaurant: "Tarragon Restaurant", iAddress: "140 S Murphy Ave., Sunnyvale, CA 94086", iCategory: "Steakhouse", iPrice: "$$", iDistance: "", iImage: #imageLiteral(resourceName: "TarragonRestaurant_BoneInRibEye")),
        FoodObject(iName: "Steak with Peppercorn Sauce", iRestaurant: "Tarragon Restaurant", iAddress: "140 S Murphy Ave., Sunnyvale, CA 94086", iCategory: "Steakhouse", iPrice: "$$", iDistance: "", iImage: #imageLiteral(resourceName: "TarragonRestaurant_SteakPeppercornSauce")),
        FoodObject(iName: "Blackberry Filet Mignon", iRestaurant: "Willard Hicks", iAddress: "280 E Campbell Ave., Campbell, CA 95008", iCategory: "Steakhouse", iPrice: "$$$", iDistance: "", iImage: #imageLiteral(resourceName: "WillardHicks_BlackberryFiletMignon")),
        FoodObject(iName: "Ginger Ponzu Rib Eye", iRestaurant: "Willard Hicks", iAddress: "280 E Campbell Ave., Campbell, CA 95008", iCategory: "Steakhouse", iPrice: "$$$", iDistance: "", iImage: #imageLiteral(resourceName: "WillardHicks_GingerPonzuRibeye")),
        FoodObject(iName: "8oz Steak", iRestaurant: "Eureka!", iAddress: "19369 Stevens Creek Blvd., Cupertino, CA 95014", iCategory: "American", iPrice: "$$", iDistance: "", iImage: #imageLiteral(resourceName: "Eureka!_8ozSteak")),
        FoodObject(iName: "Osso Bucco Riblets", iRestaurant: "Eureka!", iAddress: "19369 Stevens Creek Blvd., Cupertino, CA 95014", iCategory: "American", iPrice: "$$", iDistance: "", iImage: #imageLiteral(resourceName: "Eureka!_OssoBuccoRiblets")),
        FoodObject(iName: "Argentina Pizza", iRestaurant: "212 New York Pizza", iAddress: "19998 Homestead Rd., Cupertino, CA 95014", iCategory: "Pizza", iPrice: "$", iDistance: "", iImage: #imageLiteral(resourceName: "212NewYorkPizza_ArgentinaPizza")),
        FoodObject(iName: "Soprano", iRestaurant: "212 New York Pizza", iAddress: "19998 Homestead Rd., Cupertino, CA 95014", iCategory: "Pizza", iPrice: "$", iDistance: "", iImage: #imageLiteral(resourceName: "212NewYorkPizza_Soprano")),
        FoodObject(iName: "Sutton Place", iRestaurant: "A Taste of New York", iAddress: "1253 W El Camino Real., Sunnyvale, CA 94087", iCategory: "Pizza", iPrice: "$", iDistance: "", iImage: #imageLiteral(resourceName: "ASliceOfNewYork_SuttonPlace")),
        FoodObject(iName: "The City Combo", iRestaurant: "A Taste of New York", iAddress: "1253 W El Camino Real., Sunnyvale, CA 94087", iCategory: "Pizza", iPrice: "$", iDistance: "", iImage: #imageLiteral(resourceName: "ASliceofNewYork_TheCityComboPizza")),
        FoodObject(iName: "Bakers Pride", iRestaurant: "Cicero's Pizza", iAddress: "6138 Bollinger Rd., San Jose, CA 95129", iCategory: "Pizza", iPrice: "$$", iDistance: "", iImage: #imageLiteral(resourceName: "CicerosPizza_BakersPride")),
        FoodObject(iName: "Spicy Vegetarian", iRestaurant: "Cicero's Pizza", iAddress: "6138 Bollinger Rd., San Jose, CA 95129", iCategory: "Pizza", iPrice: "$$", iDistance: "", iImage: #imageLiteral(resourceName: "CicerosPizza_SpicyVegetarian")),
        FoodObject(iName: "Big Sur Pizza", iRestaurant: "Pizza My Heart", iAddress: "21529 Stevens Creek Blvd., Cupertino, CA 95014", iCategory: "Pizza", iPrice: "$", iDistance: "", iImage: #imageLiteral(resourceName: "PizzaMyHeart_BigSurPizza")),
        FoodObject(iName: "Fort Point Pizza", iRestaurant: "Pizza My Heart", iAddress: "21529 Stevens Creek Blvd., Cupertino, CA 95014", iCategory: "Pizza", iPrice: "$", iDistance: "", iImage: #imageLiteral(resourceName: "PizzaMyHeart_FortPointPizza")),
        FoodObject(iName: "BBQ Chicken Pizza", iRestaurant: "Legends Pizza", iAddress: "19732 Stevens Creek Blvd., Cupertino, CA 95014", iCategory: "Pizza", iPrice: "$$", iDistance: "", iImage: #imageLiteral(resourceName: "LegendsPizza_BBQChickenPizza")),
        FoodObject(iName: "Chicken Bruschetta", iRestaurant: "Legends Pizza", iAddress: "19732 Stevens Creek Blvd., Cupertino, CA 95014", iCategory: "Pizza", iPrice: "$$", iDistance: "", iImage: #imageLiteral(resourceName: "LegendsPizza_ChickenBruschetta")),
        FoodObject(iName: "BYO", iRestaurant: "Blast 825 Pizza", iAddress: "10033 Saich Way, Cupertino, CA 95014", iCategory: "Pizza", iPrice: "$", iDistance: "", iImage: #imageLiteral(resourceName: "Blast825Pizza_BYO")),
        FoodObject(iName: "Sundried Tomatoes & Pineapple", iRestaurant: "Blast 825 Pizza", iAddress: "10033 Saich Way, Cupertino, CA 95014", iCategory: "Pizza", iPrice: "$", iDistance: "", iImage: #imageLiteral(resourceName: "Blast825Pizza_SundriedTomatoes_Pineapple")),
        FoodObject(iName: "Pizza Jalapeno", iRestaurant: "Doppio Zero", iAddress: "10088 N Wolf Rd., Cupertino, CA 95014", iCategory: "Pizza", iPrice: "$$", iDistance: "", iImage: #imageLiteral(resourceName: "DoppioZero_PizzaJalapeno")),
        FoodObject(iName: "Salsiccia Pizza", iRestaurant: "Doppio Zero", iAddress: "10088 N Wolf Rd., Cupertino, CA 95014", iCategory: "Pizza", iPrice: "$$", iDistance: "", iImage: #imageLiteral(resourceName: "DoppioZero_SalsicciaPizza")),
        FoodObject(iName: "Gilroy Special", iRestaurant: "Jacks Of Saratoga", iAddress: "12175 Saratoga Sunnyvale Rd., Saratoga, CA 95070", iCategory: "Pizza", iPrice: "$$", iDistance: "", iImage: #imageLiteral(resourceName: "JacksOfSaratoga_GilroySpecial")),
        FoodObject(iName: "Garlic Chicken Pizza", iRestaurant: "Jacks of Saratoga", iAddress: "12175 Saratoga Sunnyvale Rd., Saratoga, CA 95070", iCategory: "Pizza", iPrice: "$$", iDistance: "", iImage: #imageLiteral(resourceName: "JakeOfSaratoga_GarlicChickenPizza")),
        FoodObject(iName: "Ground Beef Pizza", iRestaurant: "Stackers Pizzeria", iAddress: "18572 Prospect Rd., Saratoga, CA 95070", iCategory: "Pizza", iPrice: "$$", iDistance: "", iImage: #imageLiteral(resourceName: "StackersPizzeria_GroundBeef")),
        FoodObject(iName: "Meat Lovers Pizza", iRestaurant: "Stackers Pizzeria", iAddress: "18572 Prospect Rd., Saratoga, CA 95070", iCategory: "Pizza", iPrice: "$$", iDistance: "", iImage: #imageLiteral(resourceName: "StackersPizzeria_MeatLovers")),
        FoodObject(iName: "Black Hawk", iRestaurant: "Pizza Chicago", iAddress: "1576 Halford Ave., Santa Clara, CA 95051", iCategory: "Pizza", iPrice: "$$", iDistance: "", iImage: #imageLiteral(resourceName: "PizzaChicago_BlackHawk")),
        FoodObject(iName: "John Dillinger", iRestaurant: "Pizza Chicago", iAddress: "1576 Halford Ave., Santa Clara, CA 95051", iCategory: "Pizza", iPrice: "$$", iDistance: "", iImage: #imageLiteral(resourceName: "PizzaChicago_JohnDillinger"))
            ]

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Customize UI Navigation Bar
//        UINavigationBar.appearance().tintColor = UIColor(red: 203/255, green: 217/255, blue: 206/255, alpha: 1)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var vc: UIViewController
        
        // Control if On Boarding scene will be displayed or not
        if (UserDefaults.standard.value(forKey: "launchedBefore") as? Bool) == true {
            // show the Main scene
             vc = storyboard.instantiateViewController(withIdentifier: "NavigationController")
        } else {
            // show the On Boarding pages
            vc = storyboard.instantiateViewController(withIdentifier: "OnBoardingVC")
        }
        
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
        
        //Preload DB with initial cocktails only on first launch of application
        let firstLaunch = FirstLaunch()
        if firstLaunch.isFirstLaunch {
            if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
                for foods in grubFoods {
                    let addFood = FoodObjectMO(context: appDelegate.persistentContainer.viewContext)
                    
                    addFood.iName = foods.iName
                    addFood.iRestaurant = foods.iRestaurant
                    addFood.iAddress = foods.iAddress
                    addFood.iCategory = foods.iCategory
                    addFood.iPrice = foods.iPrice
                    addFood.iDistance = foods.iDistance
                    addFood.iImage = NSData(data: UIImagePNGRepresentation(foods.iImage!)!) as Data
                    
                    appDelegate.saveContext()
                }
            }
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "grub_project")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

