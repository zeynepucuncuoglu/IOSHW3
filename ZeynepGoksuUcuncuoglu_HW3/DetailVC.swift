//
//  DetailVC.swift
//  ZeynepGoksuUcuncuoglu_HW3
//
//  Created by Zeynep Üçüncüoğlu on 18.12.2022.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var mTitle: UINavigationItem!
    
    @IBOutlet weak var mDescription: UITextView!
    @IBOutlet weak var mImageView: UIImageView!
    
    var mRecord : Record?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let record = mRecord {
            mImageView.image = UIImage(named: record.image.lowercased())
            mDescription.text = record.description
            mTitle.title = record.name
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
