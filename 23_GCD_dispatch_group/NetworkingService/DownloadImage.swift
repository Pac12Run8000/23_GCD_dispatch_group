//
//  DownloadImage.swift
//  23_GCD_dispatch_group
//
//  Created by Michelle Grover on 11/17/22.
//

import UIKit

final class DownloadImage {
    
    public static func fetchImage(urlStr:String, completion:@escaping(_ image:UIImage) -> ()) {
        guard let url = URL(string: urlStr) else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _ , err in
            guard let data = data else {
                fatalError("There is no data.")
            }
            guard err == nil else {
                fatalError("There was an error: \(String(describing: err?.localizedDescription))")
            }
            guard let img = UIImage(data: data) else {
                fatalError("No image made.")
            }
            completion(img)
        }
        task.resume()
    }
}
