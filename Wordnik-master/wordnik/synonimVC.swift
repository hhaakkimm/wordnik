//
//  synonimVC.swift
//  wordnik
//
//  Created by Abdulkhakim Abdrakhman on 14.06.16.
//  Copyright © 2016 Abdulkhakim Abdrakhman. All rights reserved.
//

import UIKit

class synonimVC: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    var wordsArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func closeButtonPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let wordnikPVC = segue.destinationViewController as? WordnikPageVC {
            wordnikPVC.wordsArray = self.wordsArray
        }
    }
}
