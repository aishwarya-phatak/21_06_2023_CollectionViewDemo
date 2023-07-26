//
//  ViewController.swift
//  21_06_2023_CollectionViewDemo
//
//  Created by Vishal Jagtap on 26/07/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var employeeCollectionView: UICollectionView!
    var employeeCollectionViewCell : EmployeeCollectionViewCell?
    var names = ["Vaibhav","Tanaji","Vaishnavi","Prathamesh","Sahil"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerAnXIBWithCollectionView()
        employeeCollectionView.dataSource = self
        employeeCollectionView.delegate = self
    }
    
    func registerAnXIBWithCollectionView(){
        let uiNib = UINib(nibName: "EmployeeCollectionViewCell", bundle: nil)
        self.employeeCollectionView.register(uiNib, forCellWithReuseIdentifier: "EmployeeCollectionViewCell")
    }
}

extension ViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        names.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        employeeCollectionViewCell = self.employeeCollectionView.dequeueReusableCell(withReuseIdentifier: "EmployeeCollectionViewCell", for: indexPath) as! EmployeeCollectionViewCell
        
        employeeCollectionViewCell?.backgroundColor = .orange
        employeeCollectionViewCell?.empNameLabel.text = names[indexPath.row]
        employeeCollectionViewCell?.empNameLabel.backgroundColor = .clear
        
        return employeeCollectionViewCell ?? UICollectionViewCell()
    }
}

extension ViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width:(self.employeeCollectionView.frame.size.width/3),
            height:(self.employeeCollectionView.frame.size.width/3) - 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        3.0
    }
}

extension ViewController : UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("Collection View index selected--\(indexPath.item)")
    }
}
