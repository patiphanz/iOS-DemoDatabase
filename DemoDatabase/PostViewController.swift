//
//  PostViewController.swift
//  DemoDatabase
//
//  Created by Shoot Patiphan on 14/2/2562 BE.
//  Copyright © 2562 Patiphan. All rights reserved.
//

import UIKit
import FirebaseDatabase

class PostViewController: UIViewController {
    
    var ref: DatabaseReference?
    
    @IBOutlet weak var descText: UITextField!
    @IBOutlet weak var titleText: UITextField!
    @IBAction func addPost(_ sender: Any) {
        // add to firebase
        if let newPost = ref?.child("Posts").childByAutoId(){
            let id = newPost.key
            ref?.child("Posts").child(id!).child("title").setValue(titleText.text!)
            ref?.child("Posts").child(id!).child("desc").setValue(descText.text!)
        } else {
            print("error")
        }
        
        // bring back to first view
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelPost(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
