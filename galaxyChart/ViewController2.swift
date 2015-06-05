//
//  ViewController.swift
//  galaxyChart
//
//  Created by Javi on 20/5/15.
//  Copyright (c) 2015 Javier Loucim. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    
    @IBOutlet weak var chart: PeopleGalaxyView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var dataFromService: GalaxyChartResponseModel = GalaxyChartResponseModel(message: "nada", result: [])
        var node: ChartNodeModel
        
        dataFromService.message = "OK"
        
        
        
        for x in 1...20 {
            node = ChartNodeModel(nodeID: 0, name: "Sebastián Alejandro Loucim", starsQuantity: 1, color: "#00bcd4", imageID: "7", percentage: 0.0, imageURL: "http://www.likecool.com/Gear/Pic/One%20Trippy%20Profile%20Pic/One-Trippy-Profile-Pic.jpg")
            dataFromService.result.append(node)
        }
        
        
        chart?.yFrameIncrement = 5
        chart?.createChart(dataFromService)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

