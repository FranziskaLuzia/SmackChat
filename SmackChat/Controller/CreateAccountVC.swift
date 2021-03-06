//
//  CreateAccountVC.swift
//  SmackChat
//
//  Created by Franziska Kammerl on 9/17/17.
//  Copyright © 2017 Franziska Kammerl. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    // Variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var bgColor : UIColor?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        let rnd = arc4random_uniform(100)
        emailTxt.text = "test@test\(rnd).com"
        usernameTxt.text = "Flo"
        passTxt.text = "test"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
            if avatarName.contains("light") && bgColor == nil {
                userImg.backgroundColor = UIColor.lightGray
            }
        }
    }

    // Actions
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func createAccntPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        
        guard let name = usernameTxt.text , usernameTxt.text != "" else { return }
        guard let email = emailTxt.text , emailTxt.text != "" else { return }
        guard let pass = passTxt.text , passTxt.text != "" else { return }

        AuthService.instance.registerUser(email: email, password: pass) { success in
            guard success else { return }
            AuthService.instance.loginUser(email: email, password: pass, completion: { success in
                guard success else { return }
                AuthService.instance.addUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { success in
                    if success {
                        self.performSegue(withIdentifier: UNWIND, sender: nil)
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                    } else {
                        let alert = UIAlertController(title: "Error", message: "Add User call failed.", preferredStyle: .alert)
                        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                        alert.addAction(cancelButton)
                        self.show(alert, sender: self)
                    }
                    self.spinner.isHidden = true
                    self.spinner.stopAnimating()
                })
            })
        }
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        
        bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        avatarColor = "\(r), \(g), \(b), 1"
        UIView.animate(withDuration: 0.2) {
        self.userImg.backgroundColor = self.bgColor
        }
    }
    
    func setupView() {
        spinner.isHidden = true
        usernameTxt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
        emailTxt.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
        passTxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
}
