
// You can use viewcontroller as launch screen
// you can choose launch screen from general --> launch screen file, if one or more launch screen available in the project.
//  You need to set superview constraints for iphone X compatable for launch image used in launch screen.
// You can not set controller class for launch screen stroyboard used in the application.

/* Usually, splash screen is an image covering the entire screen and disappears after the main screen is loaded.
The primary purpose of splash screen is to let user know your app is loading and give user an introductory screen showing your brand. Splash screen is especially important for apps that take longer time to launch. Perceptually, it gives a better user experience.The splash screen image should be in PNG format.
 
 */

/*
 CloudKit is Apple’s remote data storage service based on iCloud. It provides a low-cost option to store and share app data using your users’ iCloud accounts as a back-end storage service.CloudKit is secure as well. Users’ private data is completely protected, as developers can only access their own private database and aren’t able to look at any users’ private data.CloudKit uses the iCloud credentials entered when the device is set up (or entered after set up via the Settings app), there’s no need to build complicated login screens.A container is the term for the conceptual location of all the app’s data on the server. It is the grouping of public and private databases.iCloud provide the free service to store data from device to iCloud platform, and user can access their data form any device via AppleID. The main purpose is users easily put own data like images, videos, etc and also access the all stored items from any Apple device like iPhone, iPad, Mac etc.
 
 You can store application data or database on icloud (5 GB free data for apple developer account). You can sync, save, load data to/from icloud account that is regiestered on device. You can find this data on different device just by login with icloud id or developer account through which you save the data with any of the device.
 */

/*  To create a folder inside repository  svn > window > new repostiory browser > open trunk url > create directory > Svn > proect > import into repository > chose local code location > enter the url for new folder created > add the files > initial commit > svn > project > checkout also to confirm that code is working or not.  To remove folder from repository > svn > window > new Repository browser > open trunk > tap on folder > remove directory*/

/*  The launch image is designed to make the perceived launch time of you app feel faster by showing something resembling the interface that will be loaded as quickly as possible. Displaying a logo does nothing but draw attention to how quickly your app loads and adds nothing to the user’s experience.
 Splash screen means, that you display an Image until your necessary information loading not complete. Like, U can see any loading image before start any heavy game. When all data loading complete then this screen removed and game statrs. It may shows for little long. Because device screen sizes vary, launch screen sizes vary too.
 */
// You can set the imageview on top of inital controller in order to implement backend api during launch of the applictaion as all the data we have  recieved we can hide it an dcontinue with our ui

// NSAppTransportSecurity used to enable internet access in the application


import UIKit

// create gloabal mainstoryboard object
let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
       
        /************  To sleep threed for seconds  ************/
       //  self.sleepThreadForSeconds()
        /************  To sleep threed for seconds  ************/
   
        /************  To delay in seconds ex = 10 seconds  ************/
       //   self.DelayMethodInSeconds()
        /************  To delay in seconds ex = 10 seconds  ************/
      
        /*****************  set rootviecontroller to window **************/
        //  self.setRootControllerToWindow()
        /*****************  set rootviecontroller to window **************/
        
        /*****************  set NavigationController to window **************/
      //    setNavigationControllerToWindow()
        /*****************  set NavigationController to window **************/
        
        return true
    }
    
   
    
    func sleepThreadForSeconds()  {
        
          Thread.sleep(forTimeInterval: 3.0)
    }
    
    func DelayMethodInSeconds() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
   
        }
        
    }
    func setNavigationControllerToWindow() {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let initialViewController: BaseVC = mainStoryboard.instantiateViewController(withIdentifier: "BaseVC") as! BaseVC
        let navigationController = UINavigationController(rootViewController: initialViewController)
        // navigationController.navigationBar.isTranslucent = true // To add navigation bar translucent
        navigationController.navigationBar.isHidden = true
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
    }
    
    func setRootControllerToWindow() {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let initialViewController: BaseVC = mainStoryboard.instantiateViewController(withIdentifier: "BaseVC") as! BaseVC
        self.window?.rootViewController = initialViewController
        self.window?.makeKeyAndVisible()
        
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
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        print("THIS LINE IS PRINTED")
        let URLString = "http://65.61.2.18/api/Activation/LicensesSubscriptions?licCode=i2M8-Nn9x-Sa3f-n7PY&deviceInfo=DDD77F05-841C-488E-B8AD-2A210C96EEEC"
        let url = URL(string: URLString)
        let request = URLRequest(url: url!)
        
        let task = session.dataTask(with: request, completionHandler: {(data, response, error) -> Void in
            if let data = data {
                print("THIS ONE IS PRINTED, TOO")
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                if let response = response as? HTTPURLResponse , 200...299 ~= response.statusCode {
                    DispatchQueue.main.async {
                        self.setNavigationControllerToWindow()
                    }
                    
                    print(response)
                    
                } else {
                    print(response ?? "")
                    
                }
            }
        })
        task.resume()
        
        
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

