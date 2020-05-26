//
//  ViewController.swift
//  increase-Image
//
//  Created by Caroline Zaini on 25/05/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var pictureIV: MyImage!
    
    var imagePicker = UIImagePickerController()
    var image: UIImage?
    
    var imageViewDetail: UIImageView? {
        didSet {
            if imageViewDetail != nil {
                imageViewDetail?.layer.circle(imageViewDetail!.frame.width)
                imageViewDetail?.backgroundColor = .black
                imageViewDetail?.image = self.image
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        holderView.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
        /// méthodes dans le fichier layer extension
        holderView.layer.radius(10)
        holderView.layer.shadow()
        
        // Image Picker
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        
        
        // tap gesture on the imageView
        let tap = UITapGestureRecognizer(target: self, action: #selector(showDetail))
        pictureIV.addGestureRecognizer(tap)
    }
    
    @objc func showDetail() {
        guard imageViewDetail == nil else { return }
        removeDetail()
        let frame = view.convert(pictureIV.frame, from: holderView)
        imageViewDetail = UIImageView(frame: frame)
        view.addSubview(imageViewDetail!)
        UIView.animate(withDuration: 1, animations: {
            self.imageViewDetail!.frame = self.view.bounds
            self.imageViewDetail!.layer.radius(0)
            self.imageViewDetail?.contentMode = .scaleAspectFit
        }) { (success) in
           
        }
        
    }

     func hideDetail() {
       let frame = view.convert(pictureIV.frame, from: holderView)
        UIView.animate(withDuration: 1, animations: {
            self.imageViewDetail?.frame = frame
            self.imageViewDetail?.layer.radius(self.pictureIV.frame.width / 2)
        }) { (success) in
            self.removeDetail()
        }
    }
    
    func removeDetail() {
        if imageViewDetail != nil {
                   imageViewDetail?.removeFromSuperview()
                   imageViewDetail = nil
               }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if imageViewDetail != nil {
            hideDetail()
        }
    }

    @IBAction func takeAPic(_ sender: UIButton) {
        /// take a pic with camera or with the gallery with tag
        let source: UIImagePickerController.SourceType = (sender.tag == 0) ? .camera : .photoLibrary
        if UIImagePickerController.isSourceTypeAvailable(source) {
            imagePicker.sourceType = source
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        image = info[.originalImage] as? UIImage
        /// assigner l'image récupérer à l'imageView du storyBoard
        pictureIV.image = image
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
}

