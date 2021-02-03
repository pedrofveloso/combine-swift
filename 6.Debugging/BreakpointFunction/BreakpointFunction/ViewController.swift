//
//  ViewController.swift
//  BreakpointFunction
//
//  Created by lapedro.veloso on 03/02/21.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    private var cancellable: AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let publisher = (0...5).publisher
        
        publisher
            .breakpoint(receiveOutput: {
                $0 % 2 != 1
            })
            .sink {
                print($0)
            }
    }
}

