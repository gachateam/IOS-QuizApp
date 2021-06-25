//
//  Ques.swift
//  QuizApp
//
//  Created by Nguyen Tien on 24/06/2021.
//

import Foundation

class Ques: CustomStringConvertible  {
    var description: String{
        return "Ques: \(ques)"
    }
    
    static let QUES_MUL = 1
    static let QUES_LISTEN = 2
    static let QUES_SPEAK = 3
    static let QUES_MUL_IMAGE = 4
    
    var type:Int
    var id:Int
    var ques:String
    
    init(type:Int,id:Int,ques:String) {
        self.type = type
        self.id = id
        self.ques = ques
    }
}
