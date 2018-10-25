//
//  ViewController.swift
//  Appareil photo 1
//
//  Created by Thierry Huu on 25/10/2018.
//  Copyright © 2018 Thierry Huu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var chosedImageView: UIImageView!
    @IBOutlet weak var noImageLabel: UILabel!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
    }

    @IBAction func shootAction(_ sender: UIButton) {
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let edite = info[.editedImage] as? UIImage {
            chosedImageView.image = edite
        } else if let originale = info[.originalImage] as? UIImage {
            chosedImageView.image = originale
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

