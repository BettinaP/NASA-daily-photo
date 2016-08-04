//
//  ViewController.swift
//  NASAAPI
//
//  Created by Bettina on 8/3/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

//viewWillLoad, didLoad only once

//willAppear, didAppear get called again

class ViewController: UIViewController {// view contorllers have a view

    //declaring this otuside viewDidLoad enables us to access this property anwyhere in our class.
    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        NASA_API_Client.getPhotoOfDay { (spaceImage) in
            self.imageView.image = spaceImage
            self.view.addSubview(self.imageView)
            self.imageView.translatesAutoresizingMaskIntoConstraints = false// any automatic stuff you thought you should do, don't do that
            self.imageView.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
            self.imageView.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor).active = true
            self.imageView.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor).active = true
            self.imageView.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor).active = true
           
            
        }//use center x,center y width & height or top bottom leading trailing

        
        //add subview enables you to stick a view into your view
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//frame is space for UIIMage...looking for x & y coordinates, width & height ...CGRectMake(all four are CGFLoat values) 
//when setting values for width and height, set them as autosize to adapt to different device screens by using constraints
//.cornerRadius has to be accessed via layer so self.profileImageView.layer.cornerRadius = 50 or whatever value (usually half of whatever width & Height is to get a fairly decent circle)

//set background colors to whatever views or frames you're creating so you can make sure they're working properly
// order matters of stacking as to what will be shown based off was entered to addSubview

//must add to subview before adding constaints, if you dont do that you will crash your app

//UIIMageView! want to use ! (and force unwrap it) so that if it's nil or didn't initialize, it should crash so you can fix it

//snp_makeConstraints ( _remakeConstraints will reset any ones you've already made and reinstall new ones)

//snapkit always follows pattern of:
//func createViews(){

    //self.profileImageView.snp_makeConstraints{ (make) in make.centerX.equalTo(self.view)
    //make.top.equalTo.(self.view).offset(20)
    //make.width.equalTo(50)
    //make.height.equalTo(50)
//  }
//}
//and remember to call self.createConstraints and self.createViews in viewDidLoad(){}


// summary:
//use storyboard is entrypoint for application, even if doing everything else programmatically
// set variety of UIelements to 
//viewDidLOad...make call for what you want to add and add everything else in separate function. first initialize each UIelement (use background colors, selectors) in createViews function and call that function
// make sure contraints get called after adding subviews, otherwise instantly run into an error
//look at snapkit docs for lots of help & stack overflow
//an advantage of doing views programmatically ---reusability!! can copy & paste base code. and can subclass that viewController and make changes
// if ever customizing cells in tableviews...


//constants folder like:
//static let navigationBarHeight= StatusBarHeight= padding=, colors=, anything that'll stay across the application
//extension of UIcolor


