//
//  SVGGenerateDogsViewController.swift
//  SVGAssignment
//
//  Created by Kuldeep Singh on 08/01/24.
//

import UIKit

class SVGGenerateDogsViewController: UIViewController {
    
    let viewModal = SVGGenerateDogsViewModal()
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var generateButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView(){
        activityIndicator.hidesWhenStopped = true
        generateButton.configureButton(title: "Generate!",titleColor: .white,cornerRadius: 10)
        
    }
    
    @IBAction func generateNewImage(_ sender: UIButton) {
        Task {
            activityIndicator.startAnimating()
            sender.isUserInteractionEnabled = false
            sender.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
            
            guard let image = await viewModal.generateDogImage() else {
                return
            }
            SVGImageCache.saveImage(image: image)
            activityIndicator.stopAnimating()
            imageView.image = image
            sender.isUserInteractionEnabled = true
            sender.backgroundColor = UIColor(red: 66/255, green: 134/255, blue: 244/255, alpha: 1.0)
            
        }
    }
}

