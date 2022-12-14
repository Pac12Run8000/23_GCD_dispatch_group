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
                fatalError("Could not get image")
            }
            self.errol = Fighter(name: "Errol The Truth Spence", image: image)
            print("Done, \(String(describing: self.errol?.name))")
            self.dispatchGroup.leave()
        }
        sleep(3)
        
        dispatchGroup.enter()
        DispatchQueue.global(qos: .userInteractive).async {
            guard let url = URL(string: "https://www.gannett-cdn.com/-mm-/7301cd4ac5f062de6947d15882ef17450914014f/c=0-0-2641-3521/local/-/media/2016/05/31/INGroup/Indianapolis/636003016676339424-GoldenGlove-05282016-20.jpg"), let data = try? Data(contentsOf: url), let image = UIImage(data: data) else {
                fatalError("Could not get image")
            }
            self.frank = Fighter(name: "Frank Martin", image: image)
            print("Done, \(String(describing: self.frank?.name))")
            self.dispatchGroup.leave()
        }
        
//        sleep(3)
        dispatchGroup.enter()
        DispatchQueue.global(qos: .userInteractive).async {
            guard let url = URL(string: "https://www.toprank.com/wp-content/uploads/2021/05/Xander_Zayas_victory.jpg"), let data = try? Data(contentsOf: url), let image = UIImage(data: data) else {
                fatalError("Could not get image")
            }
            self.xander = Fighter(name: "Xander Zayas", image: image)
            print("Done, \(String(describing: self.xander?.name))")
            self.dispatchGroup.leave()
        }
        
//        sleep(3)
        dispatchGroup.notify(queue: .main) {
            self.imageView_1.image = self.errol?.image
            self.imageView_2.image = self.frank?.image
            self.imageView_3.image = self.xander?.image
            
            self.label1.text = self.errol?.name
            self.label2.text = self.frank?.name
            self.label3.text = self.xander?.name
        }
    }
    
    


}

