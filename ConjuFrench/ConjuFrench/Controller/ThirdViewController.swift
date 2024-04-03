//
//  ThirdViewController.swift
//  ConjuFrench
//
//  Created by english on 2023-11-10.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var verbToDisplay: String?
    
    var verbSaved: FrenchVerb?
    
    var cellIsExpanded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialize()
        

    }
  
    private func initialize(){
        
        InfoVerbProvider.generateMockData()
        
        tableView.register(UINib(nibName: VerbsTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: VerbsTableViewCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.title = verbToDisplay
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return InfoVerbProvider.allInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: VerbsTableViewCell.identifier, for: indexPath) as! VerbsTableViewCell
        
        cell.setCellContent(verb: Context.verb!, indexPath: indexPath)
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
    }
    

    @objc func expandButtonTapped(_ sender: UIButton){
        
        
        cellIsExpanded = !cellIsExpanded
        
        let indexPath = IndexPath(row: sender.tag, section: 0)
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
