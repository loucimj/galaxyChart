//
//  ViewController.swift
//  galaxyChart
//
//  Created by Javi on 20/5/15.
//  Copyright (c) 2015 Javier Loucim. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView?
    
    @IBOutlet weak var chart: PeopleGalaxyView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var dataFromService: GalaxyChartResponseModel = GalaxyChartResponseModel(message: "nada", result: [])
        var node: ChartNodeModel
        
        dataFromService.message = "OK"
        
        
        
        for x in 1...20 {
            node = ChartNodeModel(nodeID: 0, name: "Maria Agustina de Las Flores", starsQuantity: 1, color: "#00bcd4", imageID: "7", percentage: 0.0, imageURL: "http://cdn.devilsworkshop.org/files/2013/01/enlarged-facebook-profile-picture.jpg")
            dataFromService.result.append(node)
        }
        
        
        chart?.yFrameIncrement = 5
        chart?.createChart(dataFromService)
        
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        scrollView?.contentSize =  CGSizeMake(scrollView!.frame.size.width, chart!.frame.height);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

