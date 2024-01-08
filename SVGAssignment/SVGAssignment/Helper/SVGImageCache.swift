//
//  SVGImageCache.swift
//  SVGAssignment
//
//  Created by Kuldeep Singh on 08/01/24.
//

import Foundation
import UIKit

final class SVGImageCache{
    
    static var cacheData:[UIImage] = [UIImage]()
    
    
    
    /// Use to save cache image Data
    /// - Parameter image: UIImage
    static func saveImage(image:UIImage){
        if cacheData.count < 20{
            cacheData.append(image)
        }else{
            cacheData.removeFirst()
            cacheData.append(image)
        }
        saveInCacheDirectory()
    }
    
    
    /// Clear Cache Data
    static func clearCacheData(){
        cacheData.removeAll()
        if FileManager.default.fileExists(atPath: returnCachePathUrl().absoluteString){
            do{
                try FileManager.default.removeItem(atPath: returnCachePathUrl().absoluteString)
            }catch{
                print(error)
            }
        }
    }
    
    
    /// Return url
    /// - Returns: Return cache directly url
    static func returnCachePathUrl() -> URL{
        return FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0].appendingPathComponent("images")
    }
    
    
    /// Save data in cache directory
    static func saveInCacheDirectory(){
        let cachePath = returnCachePathUrl()
        print(cachePath)
        do{
            let data = try NSKeyedArchiver.archivedData(withRootObject: cacheData, requiringSecureCoding: false)
            try data.write(to: cachePath)
            print("Cache SuccessFull")
        }catch{
            print(error)
        }
    }
    
    
    /// Load Back Data from local storgae
    static func loadDataFromLocalStorgae(){
        let cachePath = returnCachePathUrl()
        print(cachePath)
        
        do {
            let data = try Data(contentsOf: cachePath)
            let archiver = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)
            guard let imageData = archiver as? [UIImage] else {
                return
            }
            cacheData = imageData
            print("\(cacheData.count) items loaded Successfully")
        }catch{
          print(error)
        }
    }
}
