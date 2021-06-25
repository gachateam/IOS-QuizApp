//
//  QuesMulImage.swift
//  QuizApp
//
//  Created by Nguyen Tien on 24/06/2021.
//

import Foundation

class QuesMulImage:Ques,ProtocolGetPoint{
    func getPoint() -> Bool {
        if let userAns = userAns {
            return userAns == ansC
        }
        return false
    }
    
    var userAns:Int?
    var ans:[AnsImage]
    var ansC:Int?
    
    init(type: Int, id: Int, ques: String,ansC:Int,ans:[AnsImage]) {
        self.ans = ans
        self.ansC = ansC
        super.init(type: type, id: id, ques: ques)
    }
}

struct AnsImage {
    var ans:String
    var image:String
    
    init(ans:String,image:String) {
        self.ans = ans
        self.image = image
    }
}
