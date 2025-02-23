//
//  ViewController.swift
//  HelloLife
//
//  Created by DannyShen on 2025/2/23.
//

import UIKit

class ViewController: UIViewController {
    var counter = 0.0
    var timer:Timer!
    var timer2:Timer!
    
    @IBOutlet weak var theSegment: UISegmentedControl!
    @IBOutlet weak var theLebel: UILabel!
    
    @IBOutlet weak var theSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(addCount), userInfo: nil, repeats: true)
    }
    
    @objc func addCount(){
        let formater = DateFormatter()
        formater.dateFormat = "HH:mm:ss"
        theLebel.text = formater.string(from: Date())
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let newView = UIView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        newView.center = view.center
        newView.backgroundColor = .red
        self.view.addSubview(newView)
        newView.layer.cornerRadius = 15
        newView.clipsToBounds = true
        timer2 = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { _ in
            self.rotateView(targateView: newView)
        })
    }
    func rotateView(targateView:UIView){
        
        let angle =  counter * .pi / 180
        targateView.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
        if theSegment.selectedSegmentIndex == 0 {
            counter += Double(theSlider.value)
        }else{counter -= Double(theSlider.value)}
    }

    
    
}

