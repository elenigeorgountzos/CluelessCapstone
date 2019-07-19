//
//  ViewController.swift
//  cluelessProject
//
//  Created by girlswhocode on 7/16/19.
//  Copyright © 2019 girlswhocode. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBAction func weatherLink(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.accuweather.com/")! as URL, options: [:], completionHandler: nil)
    }
    
    var audioPlayer = AVAudioPlayer()
    
   
        
    @IBAction func playMusic(_ sender: Any) {
           audioPlayer.play()
    }
    
        
    
  
    
    @IBAction func pauseMusic(_ sender: Any) {
        if audioPlayer.isPlaying {
            audioPlayer.pause()
            
        } else {
            
        }
        
    }
    
    let backgroundImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Pixel adventures", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
        }
        catch {
            print(error)
        }
        
        setBackground()
        
        
    }
    func setBackground() {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.image = UIImage(named: "BG.jpeg")
        view.sendSubviewToBack(backgroundImageView)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
        
        let topsArray = ["t","t2","t3","t4","t5","t6"]
        let bottomsArray = ["b1","b2","b3","b4"]
        let shoesArray = ["s1","s2","s3","s4","s5"]
    
    
    @IBOutlet weak var galleriesTableView: UITableView!
    
    
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 3
        }
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            switch section {
            case 0:
                return "tops"
            case 1:
                return "bottoms"
            case 2:
                return "shoes"
                
            default:
                return ""
            }
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! TableViewCell
            switch indexPath.section {
            case 0:
                cell.itemsArray = topsArray
            case 1:
                cell.itemsArray = bottomsArray
            case 2:
                cell.itemsArray = shoesArray
            default:
                return UITableViewCell()
            }
            cell.reloadCell()
            return cell
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 250.0
        }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = .clear}
    }

    
  
    


/*extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell
     cell?.registerCollectionView(datasource: self)
       return cell!
   }

}*/
}
