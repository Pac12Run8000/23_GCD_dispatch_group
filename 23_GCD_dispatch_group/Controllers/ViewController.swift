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
    var frank:Fighter?
    var xander:Fighter?
    
    @IBOutlet weak var imageView_1: UIImageView!
    @IBOutlet weak var imageView_2: UIImageView!
    @IBOutlet weak var imageView_3: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    @IBAction func btnPressed(_ sender: UIButton) {
        dispatchGroup.enter()
        DispatchQueue.global(qos: .userInteractive).async {
            guard let url = URL(string: "https://sportshub.cbsistatic.com/i/2019/03/17/31182cfa-673f-4d22-8d9b-ed5a563b14b3/errol-spence.jpg"), let data = try? Data(contentsOf: url), let image = UIImage(data: data) else {
                fatalError("Couldn't fetch image")
                
            }
            self.errol = Fighter(name: "Error Spence", image: image)
            print("Done", self.errol)
            self.dispatchGroup.leave()
        }
        
        sleep(3)
        dispatchGroup.enter()
        DispatchQueue.global(qos: .userInteractive).async {
            guard let url = URL(string: "https://www.boxing247.com/wp-content/uploads/2022/01/Luis-Ortiz-vs-Charles-Martin-1.1.2022_Ryan-Hafey-_-Premier-Boxing-Champions13-Boxing-Photos.jpg"), let data = try? Data(contentsOf: url), let image = UIImage(data: data) else {
                fatalError("Couldn't fetch image")
                
            }
            self.frank = Fighter(name: "Frank Martin", image: image)
            print("Done", self.frank)
            self.dispatchGroup.leave()
        }
       
        sleep(3)
        dispatchGroup.enter()
        DispatchQueue.global(qos: .userInteractive).async {
            guard let url = URL(string: "https://www.toprank.com/wp-content/uploads/2021/05/Xander_Zayas_victory.jpg"), let data = try? Data(contentsOf: url), let image = UIImage(data: data) else {
                fatalError("Couldn't fetch image")
            }
            self.xander = Fighter(name: "Xander Zayas", image: image)
            print("Done", self.xander)
            self.dispatchGroup.leave()
        }
        
        
        
        dispatchGroup.notify(queue: .main) {
            self.imageView_1.image = self.errol?.image
            self.label1.text = self.errol?.name
            self.imageView_2.image = self.frank?.image
            self.label2.text = self.frank?.name
            self.imageView_3.image = self.xander?.image
            self.label3.text = self.xander?.name
        }
    }
    
    


}

