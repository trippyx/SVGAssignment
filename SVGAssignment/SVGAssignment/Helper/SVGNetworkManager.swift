//
//  NetworkManager.swift
//  SVGAssignment
//
//  Created by Kuldeep Singh on 08/01/24.
//

import Foundation
import UIKit

final class SVGNetworkManager{
    
    /// Generate Images from Server
    /// - Parameter url: Url for api
    /// - Returns: Pair of error or result
    static func generateServerRequest(url:String) async -> Result<UIImage,URLError>{
        do{
            let (data,_) = try await URLSession.shared.data(for: URLRequest(url: URL(string: url)!))
            let serverData = try JSONDecoder().decode(ServerResponse.self, from: data)
            let (imageData,_)  = try await URLSession.shared.data(from:URL(string: serverData.message)!)
            return .success(UIImage(data: imageData)!)
        }catch{
            return .failure(URLError(.cannotDecodeRawData, userInfo: ["message":error.localizedDescription]))
        }
        
    }
}
