//
//  Unit.swift
//  QuizApp
//
//  Created by Nguyen Tien on 24/06/2021.
//

import Foundation

class Unit: CustomStringConvertible {
    var description: String {
        return "\(name)"
    }
    
    var name:String
    var category: Int
    var doKho: Int
    var descriptionUnit:String
    var id:Int
    var ques:[Int]
    
    init(name:String, category: Int, doKho:Int,descriptionUnit:String,id:Int,ques:[Int]) {
        self.name = name
        self.category = category
        self.doKho = doKho
        self.descriptionUnit = descriptionUnit
        self.id = id
        self.ques = ques
    }
    
    func getListQues(listQues:[Ques]) -> [Ques] {
        var ques = [Ques]()
        print(123)
        for quesInt in self.ques {
            for quesObject in listQues {
                if quesInt == quesObject.id {
                    ques += [quesObject]
                    continue
                }
            }
        }
        
        return ques
    }
    
}
