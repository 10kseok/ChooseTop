//
//  ViewController.swift
//  ChooseTop
//
//  Created by wannabewize on 2021/07/16.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var random3IntSegmentedControl: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!
    
    var random3Int = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func generateRandom3Int(_ sender: Any) {
        random3IntSegmentedControl.removeAllSegments()
        guard random3IntSegmentedControl.numberOfSegments == 0 else { return }
        
        var tempRandomIntSet = Set<Int>()
        
        while tempRandomIntSet.count < 3 {
            tempRandomIntSet.insert(Int.random(in: 1...100))
        }
        
        random3Int = Array(tempRandomIntSet)
        
        for int in random3Int {
            random3IntSegmentedControl.insertSegment(withTitle: "\(int)", at: int, animated: true)
        }
        
    }
    
    
    @IBAction func checkAnswer(_ sender: Any) {
        let selectedIndex = random3IntSegmentedControl.selectedSegmentIndex
        var maxValueIndex: Int = 0
        
        for (idx, value) in random3Int.enumerated() {
            if value == random3Int.max() {
                maxValueIndex = idx
            }
        }
        
        let resultText =  (selectedIndex == maxValueIndex) ? "성공" : "실패"
        resultLabel.text = resultText
        
        
    }
    

}

