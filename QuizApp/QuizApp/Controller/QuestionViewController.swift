//
//  QuestionViewController.swift
//  QuizApp
//
//  Created by Nguyen Tien on 16/06/2021.
//

import UIKit

class QuestionViewController: UIViewController {

    var container:ContainerViewController!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func segmentSelectedItem(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            container.segueIdentifierReceivedFromParent("first")
        }else{
            container.segueIdentifierReceivedFromParent("second")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "container" {
            self.container = segue.destination as? ContainerViewController
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
