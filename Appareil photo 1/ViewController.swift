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
    
    func presentWithSource(_ source: UIImagePickerController.SourceType) {
        imagePicker.sourceType = source
        present(imagePicker, animated: true, completion: nil)
    }

    @IBAction func shootAction(_ sender: UIButton) {
        let alertActionSheet = UIAlertController(title: "Prendre une photo", message: "Choisissez le média", preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Appareil photo", style: .default) { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.presentWithSource(.camera)
            } else {
                let alerte = UIAlertController(title: "Erreur", message: "Aucun appareil photo n'est disponible", preferredStyle: .alert)
                
                let annuler = UIAlertAction(title: "Je comprends", style: .destructive, handler: nil)
                
                alerte.addAction(annuler)
                self.present(alerte, animated: true, completion: nil)
            }
        }
        
        let gallery = UIAlertAction(title: "Gallerie de photos", style: .default) { (action) in
            self.presentWithSource(.photoLibrary)
        }
        
        let cancel = UIAlertAction(title: "Annuler", style: .cancel, handler: nil)
        
        alertActionSheet.addAction(camera)
        alertActionSheet.addAction(gallery)
        alertActionSheet.addAction(cancel)
        
        // Pour un iPad
        if let popover = alertActionSheet.popoverPresentationController {
            popover.sourceView = view
            popover.sourceRect = CGRect(x: view.frame.midX, y: view.frame.midY, width: 0, height: 0)
            popover.permittedArrowDirections = []
        }
        
        present(alertActionSheet, animated: true, completion: nil)
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

