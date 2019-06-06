//
//  CollectionViewController.swift
//  weather
//
//  Created by Akhil James Joseph on 2019-05-15.
//  Copyright © 2019 Akhil. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
private let reuseIdentifier = "cell"

class CollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    var cities:[String] = []
    var cityId:[Int] = []
    var apiKey:String = ""
    var temperature:[Int] = []
    let addView:UIButton = {
        
       let view = UIButton()
        
        view.imageView?.image = UIImage(named: "me")
        return view
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        cities = City.cities
        cityId = City.id
        print("These are the cities \(cityId)")
        print(City.temp)
        collectionView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .blue
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        collectionView.dataSource = self
        collectionView.delegate = self
       print()
        //load cities
        //cities = City.cities
        print(cities)
        // Register cell classes
        addView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        let image:UIImage = UIImage(named: "me")!
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: UIBarButtonItem.Style.plain, target: self, action: #selector(addCity(_:)) )
        self.collectionView!.register(WeatherViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource
/*
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

*/
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return cities.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! WeatherViewCell
        
        
        cell.backgroundColor = .red
        cell.middleView.weather_image.image = UIImage(named: City.weather[indexPath.row])
        cell.middleView.temp_label.text = String(City.temp[indexPath.row])+"°C"
        cell.middleView.place_label.text = cities[indexPath.row]
        cell.middleView.weather_label.text = City.weather[indexPath.row]
        // Configure the cell
       // constraint(cell: collectionView.cellForItem(at: indexPath)!)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        return size
    }
    
    @objc func addCity(_ button: UIButton) {
        
        self.navigationController?.pushViewController(TestViewController(), animated: true)
    }
    
 
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

   
}
