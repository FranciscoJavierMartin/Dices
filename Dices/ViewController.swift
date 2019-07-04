//
//  ViewController.swift
//  Dices
//
//  Created by Francisco Martin on 04/07/2019.
//  Copyright © 2019 Francisco Martin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ImageViewDiceLeft: UIImageView!
    @IBOutlet weak var ImageViewDiceRight: UIImageView!
    
    var randomDiceIndexLeft: Int = 0
    var randomDiceIndexRight: Int = 0
    let diceImages:[String]
    let nFaces: UInt32
    
    required init?(coder aDecoder: NSCoder) {
        diceImages = (1...6).map{"dice\($0)"}
        nFaces = UInt32(diceImages.count)
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.generateRandomNumber()
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        self.generateRandomNumber()
    }
    
    private func generateRandomNumber() {
        randomDiceIndexLeft = Int(arc4random_uniform(self.nFaces))
        randomDiceIndexRight = Int(arc4random_uniform(self.nFaces))
        ImageViewDiceLeft.image = UIImage(named: diceImages[randomDiceIndexLeft])
        ImageViewDiceRight.image = UIImage(named: diceImages[randomDiceIndexRight])
    }
}

