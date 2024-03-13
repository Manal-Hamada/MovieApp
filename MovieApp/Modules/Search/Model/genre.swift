//
//  genre.swift
//  MovieApp
//
//  Created by JETS Mobile Lab on 07/02/2024.
//


import Foundation
struct GenreResponse: Decodable {

  var genres : [Genre]? = []

  enum CodingKeys: String, CodingKey {

    case genres = "genres"
  
  }

  init() {

  }

}

class Genre:  Decodable{

  var id   : Int?    = nil
  var name : String? = nil

  enum CodingKeys: String, CodingKey {

    case id   = "id"
    case name = "name"
  
  }

  init() {

  }

}

