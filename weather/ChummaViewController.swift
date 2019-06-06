//
//  ChummaViewController.swift
//  weather
//
//  Created by Akhil James Joseph on 2019-05-08.
//  Copyright © 2019 Akhil. All rights reserved.
//

import UIKit

class ChummaViewController: UIViewController {
    
    let weatherView:UIView = {
       let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let place_label:UILabel = {
       let label = UILabel()
        label.backgroundColor = .black
        label.textColor = .white
        label.font = UIFont.init(name: "KohinoorTelugu-Light", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.text = "Mississauga"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let temp_view:UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let temp_label:UILabel = {
        let label = UILabel()
        label.backgroundColor = .gray
        label.text = "23°"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.init(name: "KohinoorTelugu-Light", size: 100)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let weather_image:UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "background")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let weather_label:UILabel = {
        let label = UILabel()
        label.backgroundColor = .yellow
        label.text = "Cloudy"
        label.textColor = .gray
        label.textAlignment = .center
        label.font = UIFont.init(name: "KohinoorTelugu-Light", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.addSubview(weatherView)
      
        const()
       
    }
    
    
    func const() {
        
        //weather sub views
        weatherView.addSubview(place_label)
        weatherView.addSubview(temp_view)
        weatherView.addSubview(weather_label)
        
        //temp sub view
        temp_view.addSubview(temp_label)
        temp_view.addSubview(weather_image)
        
        // weather view const
         weatherView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.4).isActive = true
        weatherView.widthAnchor.constraint(equalTo: weatherView.heightAnchor).isActive = true
        weatherView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        weatherView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        // place label
        place_label.centerXAnchor.constraint(equalTo: place_label.superview!.centerXAnchor).isActive = true
        place_label.topAnchor.constraint(equalTo: place_label.superview!.topAnchor, constant: 10).isActive = true
        place_label.widthAnchor.constraint(equalTo: place_label.superview!.widthAnchor, multiplier: 1).isActive = true
        place_label.heightAnchor.constraint(equalTo: place_label.superview!.widthAnchor, multiplier: 0.2).isActive = true
      
        //temp view
        temp_view.centerXAnchor.constraint(equalTo: temp_view.superview!.centerXAnchor, constant: 0).isActive = true
        temp_view.widthAnchor.constraint(equalTo: temp_view.superview!.widthAnchor, multiplier: 0.75).isActive = true
        temp_view.topAnchor.constraint(equalTo:place_label.bottomAnchor , constant: 0).isActive = true
        temp_view.heightAnchor.constraint(equalTo: temp_view.superview!.heightAnchor, multiplier: 0.6).isActive = true
        //weather label
        weather_label.topAnchor.constraint(equalTo: temp_view.bottomAnchor, constant: 0).isActive = true
        weather_label.bottomAnchor.constraint(equalTo: weatherView.bottomAnchor, constant: 0).isActive = true
        weather_label.leftAnchor.constraint(equalTo: weatherView.leftAnchor, constant: 0).isActive = true
        weather_label.rightAnchor.constraint(equalTo: weatherView.rightAnchor, constant: 0).isActive = true
        
        // weather imge
        
        weather_image.topAnchor.constraint(equalTo: temp_view.topAnchor, constant: 0).isActive = true
        weather_image.bottomAnchor.constraint(equalTo: temp_view.bottomAnchor, constant: 0).isActive = true
        weather_image.leftAnchor.constraint(equalTo: temp_view.leftAnchor, constant: 0).isActive = true
        weather_image.widthAnchor.constraint(equalTo: temp_view.widthAnchor, multiplier: 0.5).isActive = true
        
        //temp label
        temp_label.topAnchor.constraint(equalTo: temp_view.topAnchor, constant: 0).isActive = true
        temp_label.bottomAnchor.constraint(equalTo: temp_view.bottomAnchor, constant: 0).isActive = true
        temp_label.leftAnchor.constraint(equalTo: weather_image.rightAnchor, constant: 0).isActive = true
        temp_label.rightAnchor.constraint(equalTo: temp_view.rightAnchor, constant: 0).isActive = true
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
