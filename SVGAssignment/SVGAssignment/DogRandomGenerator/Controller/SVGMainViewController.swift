//
//  SVGMainViewController.swift
//  SVGAssignment
//
//  Created by Kuldeep Singh on 08/01/24.
//

import UIKit

class SVGMainViewController: UIViewController {
    @IBOutlet weak var generateDogs: UIButton!
    @IBOutlet weak var recentlyGeneratedDogs: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonViews()
    }
    
    private func setupButtonViews(){
        generateDogs.configureButton(title: "Generate Dogs!",titleColor: .white, cornerRadius: 10)
        recentlyGeneratedDogs.configureButton(title: "My Recently Generated Dogs!", titleColor: .white, cornerRadius: 10)
    }
    
    @IBAction func generateDogsPushed(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SVGGenerateDogsViewController") as? SVGGenerateDogsViewController else {
            return
        }
        vc.title = "Generate Dogs!"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func myRecentlyGeneratedDogs(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SVGRecentlyGeneratedViewController") as? SVGRecentlyGeneratedViewController else {
            return
        }
        vc.title = "My Recently Generated Dogs!"
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
