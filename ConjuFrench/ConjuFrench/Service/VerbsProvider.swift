//
//  VerbsProvider.swift
//  ConjuFrench
//
//  Created by english on 2023-11-10.
//

import Foundation

class InfoVerbProvider{
    
    static var allInfo = [InfoVerb]()
    static var infoReturn : [InfoVerb] = [InfoVerb]()
    
    
    static func generateMockData(){
        
        InfoVerbProvider.allInfo = []
        
        for i in 0..<1{
            
            let groupVerbInfo = InfoVerb(groupVerbInfo: "\(i+1) | Verb Group Information")
            let verbInfo = InfoVerb(verbInfo: "\(i+1) | Verb Group Information")
            let verbConjugation = InfoVerb(verbConjugation: "\(i+1) | Verb Conjugation")
            
            allInfo.append(contentsOf: [groupVerbInfo,verbInfo,verbConjugation])
            
            
            
        }
        
    }
    
}
