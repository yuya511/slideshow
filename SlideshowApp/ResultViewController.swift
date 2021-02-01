//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 山本優也 on 2021/01/22.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var moreImage: UIImageView!
    
    var img: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        moreImage.image = img
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
