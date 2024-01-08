//
//  EndPoints.swift
//  SVGAssignment
//
//  Created by Kuldeep Singh on 08/01/24.
//

import Foundation

enum EndPoints:String{
    case randomDogUrl = "https://dog.ceo/api/breeds/image/random"
}


struct ServerResponse:Codable{
    var message:String
    var status:String
}
