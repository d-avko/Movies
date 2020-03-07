//
//  ApplicationSettingsViewController.swift
//  movies
//
//  Created by Denis Maximenko on 2/18/20.
//  Copyright © 2020 Denis Maximenko. All rights reserved.
//

import UIKit

class ApplicationSettingsViewController: UIViewController, UIFontPickerViewControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var currentFontLabel: UILabel!
    
    @IBOutlet weak var currentFontSize: UILabel!
    
    @IBOutlet weak var newFontSize: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateFonts()
    }
    
    func updateFonts(){
        DispatchQueue.main.async {
            self.currentFontLabel.text = self.currentFontLabel.font.fontName
                
            self.currentFontSize.text = String(Int(self.currentFontLabel.font.pointSize))
           }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
           //For mobile numer validation
           if textField == newFontSize {
               let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")//Here change this characters based on your requirement
               let characterSet = CharacterSet(charactersIn: string)
               return allowedCharacters.isSuperset(of: characterSet)
           }
           return true
       }
    

    @IBAction func changeFont(_ sender: Any) {
        let vc = UIFontPickerViewController()
        vc.delegate = self
        present(vc, animated: true)
    }
    
    @IBAction func changeFontSize(_ sender: Any) {
        if newFontSize.text == nil || newFontSize.text == ""{
            return
        }
        var newFontSizeInt = Int(newFontSize.text ?? "")!
        
        if newFontSizeInt < 5 {
            newFontSizeInt = 5
        } else if newFontSizeInt > 20{
            newFontSizeInt = 20
        }
        
        DispatchQueue.main.async {
            UILabel.appearance().font = UILabel.appearance().font.withSize(CGFloat(newFontSizeInt))
        }
        
        self.updateFonts()
        
    }
    
    func fontPickerViewControllerDidPickFont(_ viewController: UIFontPickerViewController) {
        guard let descriptor = viewController.selectedFontDescriptor else { return }
        
        DispatchQueue.main.async {
            UILabel.appearance().font = UIFont(descriptor: descriptor, size: 14)
        }
        
        self.updateFonts()
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
