//
//  NewListingViewController.swift
//  foodShareV1
//
//  Created by Sahil Jain on 3/17/17.
//  Copyright © 2017 foodShare. All rights reserved.
//

import UIKit
import Firebase

class NewListingViewController: UIViewController,
    UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    @IBOutlet var mealName: UITextField!
    @IBOutlet var price: UITextField!
    @IBOutlet var image: UIImageView!
    @IBOutlet var descrip: UITextField!
    @IBOutlet var allergy: UITextField!
    var ref:FIRDatabaseReference?
    let picker = UIImagePickerController()
    
    @IBAction func photoFromLibrary(_ sender: UIBarButtonItem) {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        picker.modalPresentationStyle = .popover
        present(picker, animated: true, completion: nil)
        picker.popoverPresentationController?.barButtonItem = sender
    }
    @IBAction func shootPhoto(_ sender: UIBarButtonItem) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
        picker.allowsEditing = false
        picker.sourceType = UIImagePickerControllerSourceType.camera
        picker.cameraCaptureMode = .photo
        picker.modalPresentationStyle = .fullScreen
        present(picker,animated: true,completion: nil)
        }
        else{
            noCamera()
        }
    }
    
    func noCamera(){
        let alertVC = UIAlertController(
            title: "No Camera",
            message: "Sorry, this device has no camera",
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style:.default,
            handler: nil)
        alertVC.addAction(okAction)
        present(
            alertVC,
            animated: true,
            completion: nil)
    }
    @IBAction func postNewListing(_ sender: Any) {
        if((mealName.text != "") && (price.text != "") &&  (descrip.text != "") && (allergy.text != "")){
            let post: [String] = [mealName.text!,price.text!,descrip.text!,allergy.text!]
            //let temp:Listing = Listing(meal:mealName.text!,pr:price.text!,desc:descrip.text!,dietary:allergy.text!)
            //ref?.child("Listings").setValue(temp, forKey: temp.getMealName())
            ref = FIRDatabase.database().reference()
            ref?.child("Listings").child(mealName.text!).setValue(post)
            
            
            let ac = UIAlertController(title: "Submitted", message: "Listing Succefully Submitted", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default))
            present(ac, animated: true)

            
            
        }

    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: - Delegates
    func imagePickerController(_ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]){
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        image.contentMode = .scaleAspectFit //3
        image.image = chosenImage //4
        dismiss(animated:true, completion: nil) //5
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        
    }
}
