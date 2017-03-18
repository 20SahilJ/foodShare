//
//  Listing.swift
//  foodShareV1
//
//  Created by Sahil Jain on 3/17/17.
//  Copyright © 2017 foodShare. All rights reserved.
//

import UIKit

class Listing: NSObject {
    var mealName: String
    var price:String
    var foodDescription: String
    var dietaryRestrictions:String
    //var image: UIImage!
    //var typeOfCuisine:String
    init(meal:String, pr:String,desc:String,dietary:String/**,**/ /**im:UIImage!**//**,type:String**/) {
     mealName = meal
     foodDescription = desc
     price = pr
     dietaryRestrictions = dietary
     //image = im
     //typeOfCuisine=type
     }
    func getMealName() -> String{
        return mealName;
    }
    func getPrice() -> String{
        return price;
    }
    func getFoodDescription() -> String{
        return foodDescription;
    }
    func getDietaryRestrictions() -> String{
        return dietaryRestrictions;
    }

    //func getImage() -> UIImage{
       // return image;
   // }
    //func getTypeOfCuisine() -> String{
        //return typeOfCuisine;
    //}
    func setMealName(newMeal:String){
        mealName = newMeal
    }
    func setPrice(newPrice:String){
        price = newPrice
    }
    func setFoodDescription(newFood:String){
        foodDescription = newFood
    }
    func setDietary(newDietary:String){
        dietaryRestrictions=newDietary
    }

   // func setImage(newImage:UIImage){
    //    image = newImage
   // }
    //func setTypeOfCuisine(newType:String){
        //typeOfCuisine = newType
    //}


}
