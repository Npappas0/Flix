//
//  TrailerViewController.swift
//  Flix
//
//  Created by Nick Pappas on 1/25/19.
//  Copyright © 2019 Nick Pappas. All rights reserved.
//

import UIKit
import WebKit

class TrailerViewController: UIViewController {

    var trailerURL : URL!
    var videos = [[String:Any]]()
    var youtubeURL : URL!
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(trailerURL)
        networkRequest()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func networkRequest() {
        let url = trailerURL!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                self.videos = dataDictionary["results"] as! [[String:Any]]
                self.youtubeURL = URL(string: "https://www.youtube.com/watch?v=" + (self.videos[0]["key"] as! String))
                self.webView.load(URLRequest(url: self.youtubeURL))
                // TODO: Get the array of movies
                // TODO: Store the movies in a property to use elsewhere
                // TODO: Reload your table view data
            }
        }
        task.resume()
    }
    
    @IBAction func buttonTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
