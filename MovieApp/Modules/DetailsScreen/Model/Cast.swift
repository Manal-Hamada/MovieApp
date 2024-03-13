//
//  Cast.swift
//  MovieApp
//
//  Created by JETS Mobile Lab on 26/02/2024.
//

import Foundation

struct castResponse:Decodable{
    let id: Int
    let cast, crew: [Cast]
}

struct Cast :Decodable{
    let adult: Bool
    let name, original_name: String
    let profile_path: String?
}


