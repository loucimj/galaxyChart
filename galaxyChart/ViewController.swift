//
//  ViewController.swift
//  galaxyChart
//
//  Created by Javi on 20/5/15.
//  Copyright (c) 2015 Javier Loucim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var chart: GalaxyChartView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var chartData : NSDictionary = NSDictionary.alloc()
        
        
        chart?.createChart(chartData)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

