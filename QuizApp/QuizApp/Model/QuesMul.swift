//
//  QuesMul.swift
//  QuizApp
//
//  Created by Nguyen Tien on 24/06/2021.
//

import Foundation

class QuesMul:Ques,ProtocolGetPoint{
    func getPoint() -> Bool {
        if let userAns = userAns {
            return userAns == ansC
        }
        return false
    }
    
    var userAns: Int?
    var ansC: Int
    var ans: [String]
    
    init(type:Int,ques:String,id:Int,ans:[String],ansC:Int) {
        self.ans = ans
        self.ansC = ansC
        super.init(type: type, id: id, ques: ques)
    }
}
