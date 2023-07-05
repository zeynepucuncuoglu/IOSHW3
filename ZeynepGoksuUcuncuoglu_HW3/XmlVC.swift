//
//  XmlVC.swift
//  ZeynepGoksuUcuncuoglu_HW3
//
//  Created by Zeynep Üçüncüoğlu on 10.12.2022.
//

import UIKit

class XmlVC: UIViewController {

    @IBOutlet weak var mCollectionView: UICollectionView!
    let mDataSource = DataSource()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mDataSource.populate(type: "xml")

        print("dddd")
        // Do any additional setup after loading the view.
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

extension XmlVC:  UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        print("1")
        return mDataSource.numberOfCategories()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("2")
        return mDataSource.numbeOfItemsInEachCategory(index: section)
    }
    
    // For each header setting the data
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        print("3")
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! CollectionReusableView
        
        headerView.headerLabel.text = mDataSource.getCategoryLabelAtIndex(index: indexPath.section)
        headerView.headerLabel.backgroundColor = UIColor.cyan
        
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        print("4")
        let records: [Record] = mDataSource.itemsInCategory(index: indexPath.section)
        let record = records[indexPath.row]
        
        let name = record.name
        
        cell.cellImageView.image = UIImage(named: record.image.lowercased())
        cell.cellLabel.text = name.capitalized
    
        print(record.name)
        
        return cell
    }
    
    func getIndexPathForSelectedRow() -> IndexPath? {
        var indexPath: IndexPath?
        
        if mCollectionView.indexPathsForSelectedItems!.count > 0 {
            indexPath = mCollectionView.indexPathsForSelectedItems![0] as IndexPath
        }
        
        return indexPath
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPath = getIndexPathForSelectedRow() {
            
            let record = mDataSource.itemsInCategory(index: indexPath.section)[indexPath.row]
            
            let detailViewController = segue.destination as! DetailVC
        
            detailViewController.mRecord = record
        }
    }
}
