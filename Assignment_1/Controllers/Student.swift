//
//  Student.swift
//  Assignment_1
//
//  Created by Vinh Tran on 25/9/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import Foundation

enum Student: CaseIterable {
    case vinh, jordan, phillip, joshua
    
    var name:String {
        switch self {
        case .vinh: return "Vinh"
        case .jordan: return "Jordan"
        case .phillip: return "Phillip"
        case .joshua: return "Joshua"
        }
    }
    
    var imageName:String {
        switch self {
        case .vinh: return "lion_king_1"
        case .jordan: return "lion_king_2"
        case .phillip: return "lion_king_3"
        case .joshua: return "simba_1"
        }
    }
    
    var description:String {
        switch self {
        case .vinh: return "lion_king_1"
        case .jordan: return "lion_king_2"
        case .phillip: return "lion_king_3"
        case .joshua: return "simba_1"
        }
    }
}
