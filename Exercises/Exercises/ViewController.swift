//
//  ViewController.swift
//  Exercises
//
//  Created by user1 on 16.07.2018.
//  Copyright © 2018 user1. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ViewController: UIViewController {

    @IBOutlet weak var titleData: UILabel!
    @IBOutlet weak var descriptionData: UILabel!
    @IBOutlet weak var SoManyLikes: UILabel!
    @IBOutlet weak var SoManyOptions: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

//        Alamofire.request("http://demo9453650.mockable.io/funkyData").responseJSON { response in
//            print("Request: \(String(describing: response.request))")   // original url request
//            print("Response: \(String(describing: response.response))") // http url response
//            print("Result: \(response.result)")                         // response serialization result
//
//            if let json = response.result.value {
//                print("JSON: \(json)") // serialized json response
//                print(json)
//                json.
//            }
//
//            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//
//                print("Data: \(utf8Text)") // original server data as UTF8 string
//            }
//
        Alamofire.request(URL(string: "http://demo3949499.mockable.io/funky")!).responseObject{ (response: DataResponse<FunkyModel>) in
             guard let funkyModel = response.result.value else { return }
            print(funkyModel.title)
                self.titleData.text = funkyModel.title
                self.descriptionData.text = funkyModel.description
                self.SoManyLikes.text = String(funkyModel.soManyLikes)
                
            
                var optionString = ""
                for option in funkyModel.soManyOptions {
                    optionString += "\(option)"
                }
            self.SoManyOptions.text = optionString
        }
    }
}

