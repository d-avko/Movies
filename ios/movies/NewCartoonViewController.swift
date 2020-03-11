//
//  NewCartoonViewController.swift
//  movies
//
//  Created by Denis Maximenko on 3/11/20.
//  Copyright © 2020 Denis Maximenko. All rights reserved.
//

import UIKit
import FirebaseStorage

class NewCartoonViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    
    @IBOutlet weak var durationHours: UITextField!
    @IBOutlet weak var durationMinutes: UITextField!
    
    let storage = Storage.storage()
    let database = FirebaseDb.instance
    
    @IBOutlet weak var authorInput: UITextField!
    @IBOutlet weak var ratingInput: UITextField!
    @IBOutlet weak var nameInput: UITextField!
    
    var picker = UIImagePickerController()
    var imageUrl: URL? = nil
    var videoUrl: URL? = nil
    var uploadedVideoUrl: URL? = nil
    var uploadedImageUrl: URL? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
           //For mobile numer validation
           if textField == durationHours ||  textField == durationMinutes{
               let allowedCharacters = CharacterSet(charactersIn:"0123456789 ")//Here change this characters based on your requirement
               let characterSet = CharacterSet(charactersIn: string)
               return allowedCharacters.isSuperset(of: characterSet)
           }
           return true
       }
    

    @IBAction func chooseVideo(_ sender: Any) {
        picker.delegate = self
        picker.mediaTypes = ["public.movie"]
        pickingImage = false
        pickingVideo = true
        picker.allowsEditing = false
        picker.videoExportPreset = "AVAssetExportPresetPassthrough"
        self.present(picker, animated: true, completion: nil)
    }
    
    var pickingImage = false;
    var pickingVideo = false;
    
    @IBAction func chooseImage(_ sender: Any) {
        picker.delegate = self
        picker.mediaTypes = ["public.image"]
        pickingVideo = false
        pickingImage = true
        picker.allowsEditing = false
        self.present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if(pickingVideo){
            self.videoUrl = info[.mediaURL] as? URL
            
            let ref = storage.reference().child(videoUrl?.relativeString ?? "video")
            let metadata = StorageMetadata()
            metadata.contentType = "video/quicktime"
            
            do{
                _ = ref.putData(try Data(contentsOf: self.videoUrl!), metadata: metadata,  completion:
                { metadata, error in
                    if metadata == nil{
                        let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        return
                    }
                    
                // You can also access to download URL after upload.
                    ref.downloadURL { (url, error) in
                        guard url != nil else {
                            let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                            return
                      }
                        
                        self.uploadedVideoUrl = url
                    }
                    
                })
            }
            catch {
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        

            
        }
        
        else if(pickingImage){
            guard let image = info[.imageURL] as? URL else{
                return
            }
            
            let ref = storage.reference().child(image.relativeString)

            _ = ref.putFile(from: image, metadata: nil) { metadata, error in
            // You can also access to download URL after upload.
            ref.downloadURL { (url, error) in
                guard url != nil else {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription ?? "Failed to store an image", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                return
              }
                
                self.uploadedImageUrl = url
            }
                
            }
                        
            self.imageUrl = image
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        pickingImage = false
        pickingVideo = false
        dismiss(animated: true, completion: nil)
    }

    @IBAction func createCartoon(_ sender: Any) {
        if ratingInput.text == nil || durationMinutes.text == nil || durationHours.text
        == nil || authorInput.text == nil || ratingInput.text == nil
        || nameInput.text == nil || uploadedVideoUrl == nil || uploadedImageUrl == nil{
            let alert = UIAlertController(title: "Error", message: "Fill in all the fields, select the image and the video.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        let rating = Double(ratingInput.text!)
        let durationHoursL = Int(durationHours.text!)
        let durationMinutesL = Int(durationMinutes.text!)
        
        if rating == nil || durationHoursL == nil || durationHoursL == nil
        || uploadedImageUrl == nil || uploadedVideoUrl == nil {
            let alert = UIAlertController(title: "Error", message: "Some fields container errors.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
           return
        }
        let x = durationHoursL ?? 0
        let y = (durationMinutesL ?? 0)
        let durationSeconds = x * 60 * 60 + y * 60
        
        let cartoon = Cartoon(id: 0, name: nameInput.text ?? "", author: authorInput.text ?? "", durationSeconds: durationSeconds, rating: rating ?? 0, genre: "", link: uploadedVideoUrl?.absoluteString ?? "", thumbnailLink: uploadedImageUrl?.absoluteString ?? "")
        
        database.uploadCartoonToFirebase(data: cartoon)
    }
}
