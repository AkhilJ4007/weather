//
//  WeatherViewController.swift
//  weather
//
//  Created by Akhil James Joseph on 2019-04-30.
//  Copyright © 2019 Akhil. All rights reserved.
//

import UIKit

class WeatherViewCell: UICollectionViewCell,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    var cityNames:[String] = []
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionCell
        cell.backgroundColor = .yellow
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: collectionView.frame.width * 0.2, height: collectionView.frame.height - 10)
        return size
    }

    let collection : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let table = UICollectionView(frame: CGRect(), collectionViewLayout: layout)
        table.backgroundColor = .red
        
        return table
        
    }()
    let container:UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let middleView:weatherView = {
        let view = weatherView()
        view.backgroundColor = .clear
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
   
    let imageView : UIImageView = {
       let im = UIImageView()
        im.image = UIImage(named: "background")
        im.translatesAutoresizingMaskIntoConstraints = false
        
        return im
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Do any additional setup after loading the view.
        /*
        view.addSubview(imageView)
        view.addSubview(middleView)
        view.addSubview(container)
        view.addSubview(collection)
        */
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(middleView)
        self.contentView.addSubview(container)
        self.contentView.addSubview(collection)
        
        imageView.contentMode = .scaleAspectFit
       
        collection.dataSource = self
        collection.delegate = self
        collection.frame = CGRect(x: 0, y: contentView.frame.height * 0.75, width: contentView.frame.width, height: contentView.frame.width/3)
        collection.register(CollectionCell.self, forCellWithReuseIdentifier: "cell")
        constraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class CollectionCell: UICollectionViewCell {
    
    let label:UILabel = {
        let lab = UILabel()
        lab.backgroundColor = .blue
        return lab
    
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(label)
        self.backgroundColor = .yellow
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WeatherViewCell {
    //variables
    
    // constraints'
    
    func constraints() {
        
        // imge view
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        
        // weather view const
        middleView.heightAnchor.constraint(equalToConstant: contentView.frame.height * 0.4).isActive = true
        middleView.widthAnchor.constraint(equalTo: middleView.heightAnchor).isActive = true
        middleView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        
        middleView.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: 0).isActive = true
        
        //container view
        container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        container.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        container.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        container.bottomAnchor.constraint(equalTo: collection.topAnchor, constant: 0).isActive = true
       
        
    }
    
}
