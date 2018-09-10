//
//  ViewController.swift
//  TaskCoreData
//
//  Created by user1 on 18.07.2018.
//  Copyright © 2018 user1. All rights reserved.
//

import UIKit
import CoreData
import Alamofire
import AlamofireObjectMapper

class ViewController: UIViewController {
    
    @IBOutlet weak var LName: UILabel!
    @IBOutlet weak var LSurname: UILabel!
    @IBOutlet weak var LDescription: UILabel!
    @IBOutlet weak var LLikes: UILabel!
    
    let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        removeOldData()
        let entity = NSEntityDescription.entity(forEntityName: "User", in: moc)
        let newUser = NSManagedObject(entity: entity!, insertInto: moc) as? User
//        let newUser2 = User(entity: entity!, insertInto: moc)
        

        
        Alamofire.request(URL(string: "http://demo9453650.mockable.io/userData")!).responseJSON { response in
            print(response.result.value)
            if var json = response.result.value {
                let jsonDict = json as? [String: Any]

                newUser?.setValue(jsonDict?["name"], forKey: "name")
                newUser?.surname = jsonDict!["surname"] as? String
                newUser?.email = jsonDict?["email"] as? String
                newUser?.decript = jsonDict?["description"] as? String
                newUser?.phone = jsonDict?["phone"] as? String
                newUser?.photo = jsonDict?["photo"] as? String
                
                
                do {
                    try self.moc.save()
                } catch {
                    print("Failed saving")
                }
                
            }
            self.setData()
        }
        
    }
    
    func setData(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        //  request.predicate = NSPredicate(format: "age = %@ ", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try moc.fetch(request)
            let user = result[0] as! User
            self.LDescription.text = user.decript as! String
            self.LName.text = user.name as! String
            self.LSurname.text = user.surname as! String
            
        } catch {
            
            print("Failed")
        }
    }
    
    
    
    func removeOldData(){
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        let request = NSBatchDeleteRequest(fetchRequest: fetch)
        do{
            _ = try self.moc.execute(request)
        }catch {
            print("Failed")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

