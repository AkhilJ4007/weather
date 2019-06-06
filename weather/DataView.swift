//
//  DataView.swift
//  weather
//
//  Created by Akhil James Joseph on 2019-05-15.
//  Copyright © 2019 Akhil. All rights reserved.
//

import UIKit

class weatherView: UIView {
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
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let temp_label:UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
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
        label.backgroundColor = .clear
        label.text = "Cloudy"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.init(name: "KohinoorTelugu-Light", size: 35)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        constraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        constraints()
    }
    */
    func constraints() {
        
        //weather sub views
        self.addSubview(place_label)
        self.addSubview(temp_view)
        self.addSubview(weather_label)
        
        //temp sub view
        temp_view.addSubview(temp_label)
        temp_view.addSubview(weather_image)
        
        // imge view
       /* imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        */
        // weather view const
        /*
        weatherView.heightAnchor.constraint(equalToConstant: self.frame.height * 0.4).isActive = true
        weatherView.widthAnchor.constraint(equalTo: weatherView.heightAnInstance chor).isActive = true
        weatherView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        weatherView.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: 0).isActive = true
        */
        //container view
        /*
        container.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        container.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        container.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        container.bottomAnchor.constraint(equalTo: collection.topAnchor, constant: 0).isActive = true
        */
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
        weather_label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        weather_label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        weather_label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        
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
    

}
