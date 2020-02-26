//
//  FilterMoviesViewController.swift
//  movies
//
//  Created by Denis Maximenko on 2/18/20.
//  Copyright © 2020 Denis Maximenko. All rights reserved.
//

import UIKit

class FilterMoviesViewController: UIViewController, UITextFieldDelegate {

    public var callBack: ((String, String, String) -> Void)!
    
    @IBOutlet weak var minutesText: UITextField!
    
    @IBOutlet weak var hoursText: UITextField!
    
    @IBOutlet weak var authorText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        minutesText.delegate = self
        hoursText.delegate = self
        // Do any additional setup after loading the view.
    }
    

    @IBAction func onApplyFilter(_ sender: Any) {
        callBack(minutesText?.text ?? "", hoursText?.text ?? "", authorText?.text ?? "")
    }
    
    //MARK - UITextField Delegates
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //For mobile numer validation
        if textField == minutesText ||  textField == hoursText{
            let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")//Here change this characters based on your requirement
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }

}
