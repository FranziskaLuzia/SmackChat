//
//  ProfileVCViewController.swift
//  SmackChat
//
//  Created by Franziska Kammerl on 9/26/17.
//  Copyright © 2017 Franziska Kammerl. All rights reserved.
//

import UIKit

class ProfileVCViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var ProfileImage: UIImageView!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var UserEmail: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView() 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // Actions
    
    @IBAction func CloseModalPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func logoutPressed(_ sender: Any) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    func setupView() {
        UserName.text = UserDataService.instance.name
        UserEmail.text = UserDataService.instance.email
        ProfileImage.image = UIImage(named: UserDataService.instance.avatarName)
        ProfileImage.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
    
        
    let closeTouch = UITapGestureRecognizer(target: self, action: #selector(ProfileVCViewController.closeTap))
        bgView.addGestureRecognizer(closeTouch)
}

@objc func closeTap(_ recognizer: UITapGestureRecognizer) {
    dismiss(animated: true, completion: nil)
    }
}
