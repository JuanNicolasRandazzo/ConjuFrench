//
//  InfoVerbModel.swift
//  ConjuFrench
//
//  Created by english on 2023-11-10.
//

import Foundation

class InfoVerb{
    
    var groupVerbInfo : String?
    var verbInfo : String?
    var verbConjugation : String?
    
    init(groupVerbInfo: String? = nil, verbInfo: String? = nil, verbConjugation: String? = nil) {
        self.groupVerbInfo = groupVerbInfo
        self.verbInfo = verbInfo
        self.verbConjugation = verbConjugation
    }
    
    init(){
        
    }
}
