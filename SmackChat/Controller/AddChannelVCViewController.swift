//
//  AddChannelVCViewController.swift
//  SmackChat
//
//  Created by Franziska Kammerl on 10/12/17.
//  Copyright © 2017 Franziska Kammerl. All rights reserved.
//

import UIKit

class AddChannelVCViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var chanDesc: UITextField!
    @IBOutlet weak var bgView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    
    // Actions
    
    @IBAction func createChannelPressed(_ sender: Any) {
    }
    
    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func setUpView() {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVCViewController.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
        nameTxt.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceholder])
        chanDesc.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceholder])
    }

    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}
