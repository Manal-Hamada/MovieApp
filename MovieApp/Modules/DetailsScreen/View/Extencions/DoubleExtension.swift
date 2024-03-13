//
//  DoubleExtension.swift
//  MovieApp
//
//  Created by JETS Mobile Lab on 04/03/2024.
//

import Foundation

extension Double {
    func roundTo1f() -> NSString
     {
       return NSString(format: "%.1f", self)
     }
}
