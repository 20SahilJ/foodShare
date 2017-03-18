//
//  showListingsViewController.swift
//  foodShareV1
//
//  Created by Sahil Jain on 3/17/17.
//  Copyright © 2017 foodShare. All rights reserved.
//

import UIKit
import Firebase

var currentRow:Int = 0
class showListingsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet var listingsTableView: UITableView!
    var myList:[String]=[]
    var ref:FIRDatabaseReference?
    var vcList:[String]=["ABCDID","B","C","L"]
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference()
        //print(1)
        let handle = ref?.child("Listings").observe(.childAdded, with: {(snapshot)in
            //print(2)
           //print(snapshot.key)
            if let item = snapshot.key as? String
            {
                //print(3)
                self.myList.append(item)
                self.listingsTableView.reloadData()
            }
        })
        listingsTableView.delegate=self
        listingsTableView.dataSource=self
        
        

        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        print(5)
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //allChefListings.append(Listing(meal: "Maggi", pr: "2.00", desc: "Indian Food", dietary: "Gluten"))
        print(4)
        return myList.count
        //return allChefListings.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //print(1)
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let cell = listingsTableView.dequeueReusableCell(withIdentifier: "cell")
        
        
        cell?.textLabel?.text = myList[indexPath.row]
        
        
        return cell!
        /**
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        //print(2)
        cell.textLabel?.text = myList[indexPath.row]//.getMealName();
        //print(4)
        //print(3)
        return(cell)
 **/
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcI = vcList[indexPath.row]
        let viewController = storyboard?.instantiateViewController(withIdentifier: vcI)
        //self.navigationController?.pushViewController(viewController!, animated: false)
        currentRow = indexPath.row
        self.present(viewController!, animated: false, completion: nil)
        //.showDetailViewController(viewController!, sender: indexPath)
        //pushViewController(viewController!, animated: true)
        
        //pushViewController(viewController!, animated: true)
//        print("SCREWWA")
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
