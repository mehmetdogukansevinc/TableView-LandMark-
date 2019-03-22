//
//  ViewController.swift
//  LandMark
//
//  Created by Mehmet Doğukan Sevinç on 22.03.2019.
//  Copyright © 2019 Mehmet Doğukan Sevinç. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    @IBOutlet weak var tableWiew: UITableView!
    var landMarksName = [String]()
    var landMarksImages = [UIImage]()
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableWiew.dataSource = self
        tableWiew.delegate = self
        
        landMarksName.append("Great Wall")
        landMarksName.append("Kremlin")
        landMarksName.append("Stonehenge")
        landMarksName.append("Taj Mahal")
        
        landMarksImages.append(UIImage(named: "greatwall.jpg")!)
        landMarksImages.append(UIImage(named: "kremlin.jpg")!)
        landMarksImages.append(UIImage(named: "stonehenge.jpg")!)
        landMarksImages.append(UIImage(named: "tajmahal.jpg")!)

        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landMarksName.count    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewC"{
            let destinationVC = segue.destination as! ImageViewController
            destinationVC.landMarkName = selectedLandmarkName
            destinationVC.landMarkUIımage = selectedLandmarkImage
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        selectedLandmarkName = landMarksName[indexPath.row]
        selectedLandmarkImage = landMarksImages[indexPath.row]; performSegue(withIdentifier: "toImageViewC", sender: nil)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            landMarksName.remove(at: indexPath.row)
            landMarksImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landMarksName[indexPath.row]
        return cell
    }


}

