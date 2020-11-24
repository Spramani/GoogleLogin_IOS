//
//  secondViewController.swift
//  google login
//
//  Created by MAC on 24/11/20.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

class secondViewController: UIViewController {
    var l11 : String!
    var l22 : String!
    var l33 : URL!
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var ll1: UILabel!
    @IBOutlet weak var ll2: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        ll1.text = l11
        ll2.text = l22
        
        img.layer.cornerRadius = 50
        img.layer.borderWidth = 2.0
        img.clipsToBounds = true
        
        let url = l33

           // Fetch Image Data
           if let data = try? Data(contentsOf: url!) {
               // Create Image and Update Image View
            img.image = UIImage(data: data)
        
      
           }
    }
    
    @IBAction func btn(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
       performSegue(withIdentifier: "ViewController", sender: nil)
        self.dismiss(animated: true , completion: nil)
    } catch let signOutError as NSError {
      print ("Error signing out: %@", signOutError)
    }
        
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
