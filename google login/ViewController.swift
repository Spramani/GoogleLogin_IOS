//
//  ViewController.swift
//  google login
//
//  Created by MAC on 23/11/20.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController,GIDSignInDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
        GIDSignIn.sharedInstance().delegate = self
     
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var l2: UILabel!
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
      // ...
      if let error = error {
        print("\(error.localizedDescription)")
        return
      }

      guard let authentication = user.authentication else { return }
      let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                print("Firebase Sign in error")
                print(error)
            }
            
           // print("\(authResult?.user.displayName)")
            let name = authResult?.user.displayName!
            
             let email = authResult?.user.email!
            print(name!)
            self.l1.text = name
            self.l2.text = email
            print("user is sign in with Firebase")
        }
    }

    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBOutlet weak var l1: UILabel!
    
    @IBAction func signout(_ sender: Any) {
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
        l1.text = ""
        l2.text = nil
        self.dismiss(animated: true , completion: nil)
    } catch let signOutError as NSError {
      print ("Error signing out: %@", signOutError)
    }
      
    }
}

