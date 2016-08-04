//
//  NASA_API_Client.swift
//  NASAAPI
//
//  Created by Bettina on 8/3/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import Foundation
import Alamofire //NSURL stuff baked in
import SwiftyJSON //jsonserialization, more like a translator
import AlamofireImage

class NASA_API_Client { //have all your internet stuff in one file because functions serves one class and that class as whole is API (talk to internet class) and has a single purpose
    
    //by placing class in front of the function, we can just call it from anywhere. you don't have to creat an instance or it in another file 
    // class defines a group of funcs and objects that all share characteristics or attributes
    // class functions crating functions taht aren't define to a single instance
    //class is up top in hierachy (super class is highest)
    // getting JSON file from internet through NASA API??
    
    class func getPhotoOfDay(completion: UIImage -> ()) {
        //argument to function call image into microfunction
  
        
        //        Alamofire.request(.GET, "https://api.nasa.gov/planetary/apod?api_key=teLJU5iqcev3znTAu89eZl66XVsphq7dNNDtdR36")
        //
        //
        //            .responseJSON { response in
        //                print(response.request)  // original URL request
        //                print(response.response) // URL response
        //                print(response.data)     // server data
        //                print(response.result)   // result of response serialization
        //
        //                if let JSON = response.result.value {
        //                    print("JSON: \(JSON)")
        //                }
        //        }
        
        //repsonse is a tuple and we're unwrapping it and doing things to it.
        // .result us a tuple itself (value, error)
        //   JSON is declared as a struct within swiftyJSON
        
//        Alamofire.download(.GET, url) { temporaryURL, response in
//            let fileManager = NSFileManager.defaultManager()
//            let directoryURL = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
//            let pathComponent = response.suggestedFilename
//            
//            return directoryURL.URLByAppendingPathComponent(pathComponent!)
//        }
        
        
        
        
        //temporarily download image from internet to your phone using Alamofire
        Alamofire.request(.GET, "https://api.nasa.gov/planetary/apod?api_key=\(Secrets.key)").validate().responseJSON { response in //completion block is only run once the main request function is done
            
            print("THIS IS THE FIRST ALAMOFIRE FUNCTION")
            switch response.result { //result is a tuple (value, error)
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)//if result is a success, after reaching out with alamo fire to our url, turning our value into a JSONObject (basically a giant dictionary)... contains a key titled "url" that is url to the image. value is anyobject...just data that we got back from request, we don't know what we got back so swiftyJSON please turn it into JSONobject so we can reach in with key and get back value for url and then convert to string
                    print("JSON: \(json)")
                    //Getting a string from a JSON Dictionary
                    let imageURL = json["url"].stringValue //getting url value (jsonobject) converting it to string
                    print("image URL:\(imageURL)")
                   
                    //the below is getting us data at the imageURL that we just received from JSON
                    Alamofire.request(.GET, imageURL)
                        .responseImage { response in
                            
                            print("thisis the second af function")
                            debugPrint(response)
                            
                            print(response.request)
                            print(response.response)
                            debugPrint(response.result)
                            
                            if let image = response.result.value {
                                print("image downloaded: \(image)")
                                completion(image)
                                
                                print("end of second af function")
                              // can't return image in completion closure, breaks out of block not out of whole function. must do it from outside block
                            }
                    }
                }
            case .Failure(let error):
                print(error)
            }
            print("this is end of first af function")
        }
       print("end of our entire function")//completion blocks aren't done by time main function hits return so we need to write a completion block so cant say "return image" here...hang on, don't ask for UIImage yet
        
        
    }
    
}



//nsurl session for get method need: stringURL,  URL, session, task ( do, try , catch) and resume task.

//do try to do this thing "...what do you want to try?" and if not catch the error...im trying it because it might fail so techinically not officially doing
//NSJSONSerialization.JSONObjectWithData(data! option: ) parse through data and turn it into data i can understand

