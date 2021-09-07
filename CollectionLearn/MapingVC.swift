//
//  MapingVC.swift
//  CollectionLearn
//
//  Created by Gladkov Maxim on 07.09.2021.
//

import UIKit
import Alamofire
import ObjectMapper
import AlamofireObjectMapper


class MapingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        self.view.addSubview(lbl)
        lbl.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        lbl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        lbl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        lbl.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        self.view.addSubview(btn)
        btn.topAnchor.constraint(equalTo: lbl.bottomAnchor, constant: 60).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        btn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        
    }
    
    let lbl: UILabel = {
        let b = UILabel()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = .white
        b.text = "default text"
        b.textColor = .black
        b.textAlignment = .center
        b.numberOfLines = 0
        return b
    }()
    
    let btn: UIButton = {
        let c = UIButton()
        c.translatesAutoresizingMaskIntoConstraints = false
        c.backgroundColor = .gray
        c.setTitle("get", for: .normal)
        c.addTarget(self, action: #selector(getText), for: .touchUpInside)
        return c
    }()
    
    @objc func getText(sender: UIButton){
        send()
    }
    
    func send(){
        let url = "https://evilinsult.com/generate_insult.php?lang=en&type=json"
        Alamofire.request(url).responseObject { (response:DataResponse<Insult>) in
        
        let insult = response.result.value
            print(insult?.insult)
            guard let text = insult?.insult else {return}
            self.lbl.text = text
    }
}
}

class Insult: Mappable{
    
    var number: String?
    var language: String?
    var insult: String?
    var created: String?
    var shown: String?
    var createdby: String?
    var active: String?
    var comment: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        number <- map["number"]
        language <- map["language"]
        insult <- map["insult"]
        created <- map["created"]
        shown <- map["shown"]
        createdby <- map["createdby"]
        active <- map["active"]
        comment <- map["comment"]

    }
}
