//
//  Category.swift
//  QuizApp
//
//  Created by Nguyen Tien on 24/06/2021.
//

public class Category: CustomStringConvertible {
    var category: String
    
    init(category:String) {
        self.category = category
    }
    
    public var description: String {
        return "category \(category)"
    }
}
