//
//  MenuViewController.swift
//  CollectionLearn
//
//  Created by Gladkov Maxim on 05.09.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemTeal
        self.view.addSubview(collectionView)
        collectionView.backgroundColor = .systemTeal
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: self.view.frame.width/2).isActive = true
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CVCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    let data = [CollElem(title: "time 1", image: #imageLiteral(resourceName: "timer2")),
                CollElem(title: "time 2", image: #imageLiteral(resourceName: "timer")),
                CollElem(title: "time 3", image: #imageLiteral(resourceName: "timer3")),
                CollElem(title: "time 4", image: #imageLiteral(resourceName: "timer2"))]
    
}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3, height: collectionView.frame.width/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CVCell
        cell.data = data[indexPath.row]
        return cell
    }
    
}
