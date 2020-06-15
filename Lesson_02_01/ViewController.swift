//
//  ViewController.swift
//  Lesson_02_01
//
//  Created by Glumer Glumer on 15.06.2020.
//  Copyright © 2020 UCG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginTextField : UITextField!
    @IBOutlet weak var passwordTextField : UITextField!
    
    @IBAction func buttonSigninPressed(_ sender: UIButton) {
        print(#function)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }

    @objc func keyboardWillShow(notification: Notification){
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        print("scrollView height before = \(scrollView.contentInset.bottom)")
        print("frame \(scrollView.frame.height)")
    }
    
    @objc func keyboardWillHide(notification: Notification){
        scrollView.contentInset = .zero
        print("scrollView height after = \(scrollView.contentInset.bottom)")
        print("frame \(scrollView.frame.height)")
    }
    
    @IBAction func scrollTapped(_ gesture: UITapGestureRecognizer) {
        scrollView.endEditing(true)
    }

}

