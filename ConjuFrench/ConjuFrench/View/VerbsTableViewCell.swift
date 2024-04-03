//
//  VerbsTableViewCell.swift
//  ConjuFrench
//
//  Created by english on 2023-11-13.
//

import UIKit

class VerbsTableViewCell: UITableViewCell{

    static let identifier = "VerbsTableViewCell"
    
    @IBOutlet weak var lblGroupVerbInfo: UILabel!
    @IBOutlet weak var lblVerbInfo: UILabel!
    @IBOutlet weak var lblVerbConjugation: UILabel!
    
    public var verb : InfoVerb?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    ///Set cell content with the given Task object
    public func setCellContent(verb: FrenchVerb, indexPath: IndexPath){
        
        
        
        switch indexPath.row{
        case 0:
            lblGroupVerbInfo.text = verb.fullDescription  //verb.groupVerbInfo
        case 1:
            lblGroupVerbInfo.text = verb.wordConjugateWhichVerbModel
        case 2:
            lblGroupVerbInfo.text = verb.wordConjugateRule
        default:
            
            lblGroupVerbInfo.text = ""
            
            //lblGroupVerbInfo.text = verb.groupVerbInfo
            //lblVerbInfo.text = verb.verbInfo
            //lblVerbConjugation.text = verb.verbConjugation
        }
        
        
    }
    
    

}
