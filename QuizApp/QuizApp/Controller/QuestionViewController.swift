//
//  QuestionViewController.swift
//  QuizApp
//
//  Created by Nguyen Tien on 16/06/2021.
//

import UIKit

class QuestionViewController: UIViewController {

    var container:ContainerViewController!
    var question: [Ques]!
    var position = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
        self.tabBarController?.tabBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func clickNext(_ sender: Any) {
        if position < question.count - 1 {
            position+=1
        }
        updateUI()
    }
    
    func updateUI()  {
        switch question[position].type {
        case Ques.QUES_MUL:
            container.segueIdentifierReceivedFromParent("mul")
            if let getMul = container.children[position] as? QuesMulViewController {
                getMul.ques.text = question[self.position].ques
            }
            return
        case Ques.QUES_SPEAK:
            container.segueIdentifierReceivedFromParent("speak")
            if let getMul = container.children[position] as? QuesSpeakViewController {
                getMul.ques.text = question[self.position].ques
            }
            return
        case Ques.QUES_LISTEN:
            container.segueIdentifierReceivedFromParent("listen")
            if let getMul = container.children[position] as? QuesListenViewController {
                getMul.ques.text = question[self.position].ques
            }
            return
        case Ques.QUES_MUL_IMAGE:
            container.segueIdentifierReceivedFromParent("image")
            if let getMul = container.children[position] as? QuesMulImageViewController {
                getMul.ques.text = question[self.position].ques
            }
            return
        default:
            return
        }
    }
//
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "container" {
            self.container = segue.destination as? ContainerViewController
        }
    }
}
