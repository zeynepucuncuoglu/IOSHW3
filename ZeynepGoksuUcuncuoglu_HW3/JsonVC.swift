//
//  JsonVC.swift
//  ZeynepGoksuUcuncuoglu_HW3
//
//  Created by Zeynep Üçüncüoğlu on 10.12.2022.
//

import UIKit

class JsonVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var mTableview: UITableView!
    
    let mDataSource = DataSource()
    
    @IBAction func unwindToMain(_ sender: UIStoryboardSegue) {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return mDataSource.numberOfCategories()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return mDataSource.numbeOfItemsInEachCategory(index: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //var cell = UITableViewCell()
        
        // Recommended way
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        let records: [Record] = mDataSource.itemsInCategory(index: indexPath.section)
        let record = records[indexPath.row]
        
        cell.textLabel?.text = record.name
        cell.imageView?.image = UIImage(named: record.name.lowercased())
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let label : UILabel = UILabel()
        
        label.frame = CGRect(x: 20, y: 8, width: 320, height: 40)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = self.tableView(tableView, titleForHeaderInSection: section)
        label.textAlignment = NSTextAlignment.center
        label.backgroundColor = UIColor.orange
        //label.text = self.tableView(tableView, titleForHeaderInSection: section)
        
        let headerView = UIView()
        headerView.addSubview(label)
        
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0;//Choose your custom row height
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
            return mDataSource.getCategoryLabelAtIndex(index: section)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPath = getIndexPathForSelectedRow() {
            
            let record = mDataSource.itemsInCategory(index: indexPath.section)[indexPath.row]
            
            let detailViewController = segue.destination as! DetailVC
            
            detailViewController.mRecord = record
        }
    }
    
     // Our function to have a reference to indexPath for the TableView
    func getIndexPathForSelectedRow() -> IndexPath? {
        var indexPath: IndexPath?
        
        if mTableview.indexPathsForSelectedRows!.count > 0 {
            indexPath = mTableview.indexPathsForSelectedRows![0] as IndexPath
        }
        
        return indexPath
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mDataSource.populate(type: "json")
        
                
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
