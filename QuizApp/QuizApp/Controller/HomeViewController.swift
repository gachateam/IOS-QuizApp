//
//  HomeViewController.swift
//  QuizApp
//
//  Created by Nguyen Tien on 23/06/2021.
//

import UIKit
import Firebase

class HomeViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    //MARK: - properties
    var question:[String] = []
    var categorys = [Category]()
    var ques = [Ques]()
    var ref:DatabaseReference!
    var unit = [Unit]()
    //Để Hidden Navigation
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return unit.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell {
            
            cell.question.text = self.unit[indexPath.row].name
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 8
            
            return cell
        }else{
            fatalError("can not create celll")
        }
        
    }
    
    @IBOutlet var listQues:UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listQues.dataSource = self
        listQues.delegate = self
        
        ref = Database.database().reference()
        
        self.ref.child("category").observeSingleEvent(of: .value, with: {
            snapshot in
            guard let values = snapshot.value as? [Any] else{
                return
            }
            
            
            for (value) in values {
                guard let category = value as? [String: String] else {
                    continue
                }
                self.categorys += [Category(category: category["category"]!)]
            }
            
            print(self.categorys)
        })
        
        self.ref.child("ques").observeSingleEvent(of: .value, with: {
            snapshot in
            //let dataSnapshot = snapshot.value as? [AnyObject] ?? []
            
            guard let dataSnapshot = snapshot.value as? [AnyObject] else {
                return
            }
            
            for data in dataSnapshot {
                guard let child = data as? NSDictionary,
                      let type = child["type"] as? Int,
                      let ques = child["ques"] as? String,
                      let id = child["id"] as? Int else {
                    
                    continue
                }
                
                switch type {
                case Ques.QUES_MUL:
                    guard let ansC = child["ansC"] as? Int,
                       let ans = child["ans"] as? [String] else{
                        print(child)
                        continue
                    }
                    self.ques += [QuesMul(type: type, ques: ques, id: id, ans: ans, ansC: ansC) as Ques]
                    continue
                case Ques.QUES_LISTEN:
                    self.ques += [QuesListen.init(type: type, id: id, ques: ques) as Ques]
                    continue
                case Ques.QUES_SPEAK:
                    self.ques += [QuesSpeak.init(type: type, id: id, ques: ques) as Ques]
                    continue
                case Ques.QUES_MUL_IMAGE:
                    if let ansC = child["ansC"] as? Int,
                       let ans = child["ans"] as? [NSDictionary]{
                        var ansImages = [AnsImage]()
                        for ans1 in ans {
                            if let ansImage = ans1["ans"] as? String,
                               let image = ans1["image"] as? String{
                                ansImages += [AnsImage(ans: ansImage, image: image)]
                            }
                        }
                        self.ques += [QuesMulImage(type: type, id: id, ques: ques, ansC: ansC, ans: ansImages) as Ques]
                    }
                    continue
                default:
                    print("err")
                    continue
                }
            }
            
            print(self.ques)
            
        })
        
        self.ref.child("unit").observeSingleEvent(of: .value, with: {
            snapshot in
            
            guard let dataSnapshot = snapshot.value as? [NSDictionary] else {
                return
            }
            
            for data in dataSnapshot {
                guard let name = data["name"] as? String,
                      let description = data["description"] as? String,
                      let id = data["id"] as? Int,
                      let doKho = data["dokho"] as? Int,
                      let category = data["category"] as? Int,
                      let ques = data["ques"] as? [Int] else{
                    continue
                }
                self.unit += [Unit(name: name, category: category, doKho: doKho, descriptionUnit: description, id: id, ques: ques)]
            }
            
            self.listQues.reloadData()
        })
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let _ = sender as? CollectionViewCell {
            if let indexPaths = listQues.indexPathsForSelectedItems,let sourceControll = segue.destination as? QuestionViewController{
                
                let indexPath = indexPaths[0] as NSIndexPath
                sourceControll.question = self.unit[indexPath.row].getListQues(listQues: self.ques)
                
            }
        }
    }
}
