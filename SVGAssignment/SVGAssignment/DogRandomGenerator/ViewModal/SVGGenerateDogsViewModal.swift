//
//  GenerateDogsViewModal.swift
//  SVGAssignment
//
//  Created by Kuldeep Singh on 08/01/24.
//

import Foundation
import UIKit

class SVGGenerateDogsViewModal{
    
    func generateDogImage() async -> UIImage?{
        let imageData = await SVGNetworkManager.generateServerRequest(url: EndPoints.randomDogUrl.rawValue)
        switch imageData {
        case .success(let success):
            return success
        case .failure(_):
            return nil
        }
    }
}
