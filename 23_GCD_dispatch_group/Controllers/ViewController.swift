//
//  ViewController.swift
//  23_GCD_dispatch_group
//
//  Created by Michelle Grover on 11/17/22.
//

import UIKit

class ViewController: UIViewController {
    
    let dispatchGroup = DispatchGroup()
    
    var errol:Fighter?
    
    @IBOutlet weak var imageView_1: UIImageView!
    
    @IBOutlet weak var imageView_2: UIImageView!
    
    @IBOutlet weak var imageView_3: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnPressed(_ sender: UIButton) {
        dispatchGroup.enter()
        DispatchQueue.global(qos: .userInteractive).async {
            guard let url = URL(string: "https://sportshub.cbsistatic.com/i/2019/03/17/31182cfa-673f-4d22-8d9b-ed5a563b14b3/errol-spence.jpg"), let data = try? Data(contentsOf: url), let image = UIImage(data: data) else {
                fatalError("Couldn't fetch image")
            }
            self.errol = Fighter(name: "Error Spence", image: image)
        }
        dispatchGroup.leave()
        sleep(3)
    }
    
    


}

