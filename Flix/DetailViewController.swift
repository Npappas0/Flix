//
//  DetailViewController.swift
//  Flix
//
//  Created by Nick Pappas on 1/16/19.
//  Copyright © 2019 Nick Pappas. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var synopsisLabel: UITextView!
    
    var titleText : String!
    var posterURL : URL!
    var synopsis : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        posterView.af_setImage(withURL: posterURL)
        titleLabel.text = titleText
        synopsisLabel.text = synopsis
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
