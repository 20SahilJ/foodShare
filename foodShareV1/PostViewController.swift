//
//  PostViewController.swift
//  foodShareV1
//
//  Created by Sahil Jain on 3/18/17.
//  Copyright © 2017 foodShare. All rights reserved.
//

import UIKit
import Firebase

class PostViewController: UIViewController {

    
    @IBOutlet var mealNameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var allergyLabel: UILabel!
    var myList:[[String]] = [[]]
    var ref:FIRDatabaseReference?
    override func viewDidLoad()
    {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference(withPath: "Listings")
        /**print("hi")
        
        ref?.observeSingleEvent(of: .value, with: {snapshot in
            print("pat")
            let enumerator = snapshot.children
            print("and")
            print(enumerator)
            //print(snapshot.value)
            var list = [String]()
            while let rest = enumerator.nextObject() as?
                FIRDataSnapshot {
                    print("patty")
                    print(rest.value)
                    list.append(rest.value as! String)
            }
            self.myList.append(list)
        })
        mealNameLabel.text=myList[currentRow][0]
        priceLabel.text=myList[currentRow][1]
        descriptionLabel.text=myList[currentRow][2]
        allergyLabel.text=myList[currentRow][3]**/
            
            
            
            
            
            
        /**ref?.observeSingleEvent(of: .value, with: {snapshot in
            print(snapshot)
            let enumerator = snapshot.children
            print("and")
            print(enumerator)
            //print(snapshot.value)
            var list = [String]()
            while let rest = enumerator.nextObject() as?
                FIRDataSnapshot {
                    print("patty")
                    print(rest.value)
                list.append(rest.value as! String)
            }
            self.myList.append(list)
        })
        print(currentRow)
        mealNameLabel.text=myList[currentRow][0]
        priceLabel.text=myList[currentRow][1]
        descriptionLabel.text=myList[currentRow][2]
        allergyLabel.text=myList[currentRow][3]
 **/
    }
//        var x:AnyObject = myList[currentRow].values as AnyObject
//        print(x)
//        if let i = x as? [String]{
//            print("yay")
            //do stuff
//            mealNameLabel.text = i[0]
//            priceLabel.text=i[1]
//            descriptionLabel.text=i[2]
//            allergyLabel.text=i[3]
    

    
        
        // Do any additional setup after loading the view.
    
    @IBAction func orderFrom1(_ sender: Any) {
        let alertController = UIAlertController(title: "Successfully submitted order for Cheeseburger. Payment Due: 3.00", message: nil, preferredStyle: .alert )
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
    @IBAction func orderFrom2(_ sender: Any) {
        let alertController = UIAlertController(title: "Successfully submitted order for Maggi. Payment Due: 3.00", message: nil, preferredStyle: .alert )
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
    @IBAction func orderFrom3(_ sender: Any) {
        let alertController = UIAlertController(title: "Successfully submitted order for Sticky Rice. Payment Due: 1.50", message: nil, preferredStyle: .alert )
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
    @IBAction func orderFrom4(_ sender: Any) {
        let alertController = UIAlertController(title: "Successfully submitted order for Thai Curry. Payment Due: 5.00", message: nil, preferredStyle: .alert )
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
