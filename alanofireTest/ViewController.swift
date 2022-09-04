//
//  ViewController.swift
//  alanofireTest
//
//  Created by Александр Морозов on 04.09.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageJson: UIImageView!
    @IBOutlet weak var activityidentificator: UIActivityIndicatorView!
    
    var imageUrl: String = "https://www.ixbt.com/img/n1/news/2019/8/3/ALL-other-iPhone_0_large.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageJson.layer.cornerRadius = 20
        activityidentificator.startAnimating()
        downloadImage(url: imageUrl)
        
    }


    func downloadImage(url: String) {
        
        AF.download(url)
            
            .validate()
            .responseData { (response) in
            if let data = response.value {
                
                let image = UIImage(data: data)
                
                self.imageJson.image = image
                
                
                self.activityidentificator.stopAnimating()
                self.activityidentificator.isHidden = true
                //self.activityidentificator.isHidden = true
                
            }
            
            else {
                print("error")
                
            }
        }
    
     
                
            
        }
        
    }
    


