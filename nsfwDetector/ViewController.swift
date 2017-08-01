//
//  ViewController.swift
//  nsfwDetector
//
//  Created by Yiwei Ni on 7/31/17.
//  Copyright © 2017 Yiwei Ni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


// MARK: - IBActions
extension ViewController {
    
    @IBAction func pickImage(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .savedPhotosAlbum
        present(pickerController, animated: true)
    }
    
    func detectPhoto(image: UIImage) {
        answerLabel.text = "predicting..."
        answerLabel.textAlignment = .center
        
        // ...
        
    }
}


// MARK: - UIImagePickerControllerDelegate
extension ViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        dismiss(animated: true)
        
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Can not load image from Photos")
        }
        
        photo.image = image
        detectPhoto(image: image)
    }
}


// MARK: - UINavigationControllerDelegate
extension ViewController: UINavigationControllerDelegate {
}

