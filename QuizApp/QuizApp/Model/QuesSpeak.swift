//
//  QuesSpeak.swift
//  QuizApp
//
//  Created by Nguyen Tien on 24/06/2021.
//

import Foundation

class QuesSpeak: Ques,ProtocolGetPoint {
    func getPoint() -> Bool {
        if let userAns = userAns {
            return userAns == ques
        }
        return false
    }
    var userAns:String?
    
    override init(type: Int, id: Int, ques: String) {
        super.init(type: type, id: id, ques: ques)
    }
}
