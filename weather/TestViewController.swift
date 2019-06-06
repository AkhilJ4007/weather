//
//  TestViewController.swift
//  weather
//
//  Created by Akhil James Joseph on 2019-05-10.
//  Copyright © 2019 Akhil. All rights reserved.
//

// USE THIS AS SEARCH VIEW CONTROLLER
import UIKit
import Alamofire
import SwiftyJSON
import InstantSearchClient
class TestViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityResults.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TableCell
        City.cities.append(cell.label.text!)
        City.id.append(cityId[indexPath.row])
        network(id: cityId[indexPath.row])
        //self.navigationController?.popViewController(animated: true)
        print(cell.label.text!)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableCell
        cell.label.text = cityResults[indexPath.row]
       print(cityId)
        return cell
    }
    

    var cityName:String = ""
    var cityResults:[String] = []
    var cityId :[Int] = []
    var apiKey:String = "973d3346b9adcf21c88d0798666bbd61"
    
    let searchResults:UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let cityField:UITextField = {
       let text =  UITextField()
        text.placeholder = "Enter here"
        text.backgroundColor = .gray
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.addSubview(searchResults)
        view.addSubview(cityField)
        // delegate data source
        searchResults.dataSource = self
        searchResults.delegate = self
        // registering cell
        searchResults.register(TableCell.self, forCellReuseIdentifier: "cell")
        //targets
        cityField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
       
        //network()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        constrain()
        constrainTable()
        
    }
    
   
    
    func search(city:String) {
       
        // let client = Client(appID: "PJ18RKTT90", apiKey: "2481852146ca5f6776f08c031102e481")
        // new id
        let client = Client()
        

        // Load content file
        let index = client.index(withName: "city")
        let query = Query(query: "\(city)")
        query.length = 4
        query.offset = 0
        // search by firstname
        
        index.search(query, completionHandler: { (content, error) -> Void in
            if error == nil {
               // print("Result: \(content!)")
                
                let json = JSON(content)
                for index in 0..<2{
                     print(json["hits"][index]["name"])
                     let cityName:String? = json["hits"][index]["name"].string
                    let cityId:Int? = json["hits"][index]["id"].int
                     if cityName != nil{
                        self.cityResults.append(cityName!)
                        self.cityId.append(cityId!)
                    }
                    }
                DispatchQueue.main.async {
                    self.searchResults.reloadData()
                  
    
                    print(City.cities)
                    print(City.id)
                }
                
            }
            else{
                print("error")
            }
        })
    }

    
   
    // text field
    @objc func textFieldDidChange(_ textField: UITextField) {
        cityResults.removeAll()
        cityId.removeAll()
        if let text = textField.text {
            cityName = text
            search(city: cityName)
        }
        
    }
    
    func network(id:Int) {
        let url = "https://api.openweathermap.org/data/2.5/weather?id=\(id)&APPID=\(apiKey)"
        print(url)
        Alamofire.request(url).responseJSON { response in
            print("Result: \(response.result.value)")
            if let test = response.result.value{
                let json = JSON(test)
                let temp = Int(json["main"]["temp"].float!) - 273
                let weather = json["weather"][0]["main"].string!
                 DispatchQueue.main.async {
                    City.temp.append(temp)
                    City.weather.append(weather)
                    self.navigationController?.popViewController(animated: true)
                    
                }
                
                //Now you got your value
                
                
            }
            
            
        }
        
        
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

class TableCell: UITableViewCell {
    let label : UILabel = {
       let lab = UILabel()
        lab.backgroundColor = .white
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(label)
        const()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func const(){
        label.centerYAnchor.constraint(equalToSystemSpacingBelow: self.centerYAnchor, multiplier: 1).isActive = true
        label.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}


extension TestViewController {
    func constrain() {
        
        // cityField.frame = CGRect(x: 0, y: (navigationController?.navigationBar.frame.height)!, width: (navigationController?.navigationBar.frame.width)!, height: 100)
        cityField.topAnchor.constraint(equalToSystemSpacingBelow: (navigationController?.navigationBar.bottomAnchor)!, multiplier: 1).isActive = true
        cityField.leftAnchor.constraint(equalToSystemSpacingAfter: view.leftAnchor, multiplier: 1).isActive = true
        cityField.rightAnchor.constraint(equalToSystemSpacingAfter: view.rightAnchor, multiplier: 1).isActive = true
        cityField.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func constrainTable() {
        searchResults.topAnchor.constraint(equalToSystemSpacingBelow: cityField.bottomAnchor, multiplier: 1).isActive = true
        searchResults.bottomAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor, multiplier: 1).isActive = true
        searchResults.leftAnchor.constraint(equalToSystemSpacingAfter: view.leftAnchor, multiplier: 1).isActive = true
        searchResults.rightAnchor.constraint(equalToSystemSpacingAfter: view.rightAnchor, multiplier: 1).isActive = true
        
    }
}
