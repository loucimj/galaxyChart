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

        var dataFromService: GalaxyChartResponseModel = GalaxyChartResponseModel(message: "nada", result: [])
        var node: ChartNodeModel
        
        dataFromService.message = "OK"
        
        node = ChartNodeModel(nodeID: 0, name: "Think Big", starsQuantity: 5, color: "#614c97", imageID: "1", percentage: 0.0)
        dataFromService.result.append(node)
        
        node = ChartNodeModel(nodeID: 0, name: "Achiever", starsQuantity: 2, color: "#6cb143", imageID: "7", percentage: 0.0)
        dataFromService.result.append(node)
        
        node = ChartNodeModel(nodeID: 0, name: "Awesome", starsQuantity: 2, color: "#00bcd4", imageID: "7", percentage: 0.0)
        dataFromService.result.append(node)
        

        node = ChartNodeModel(nodeID: 0, name: "Constantly Innovate", starsQuantity: 7, color: "#223c90", imageID: "7", percentage: 0.0)
        dataFromService.result.append(node)

        node = ChartNodeModel(nodeID: 0, name: "Leadership", starsQuantity: 3, color: "#008d80", imageID: "7", percentage: 0.0)
        dataFromService.result.append(node)

        node = ChartNodeModel(nodeID: 0, name: "Have Fun", starsQuantity: 2, color: "#f5b60d", imageID: "7", percentage: 0.0)
        dataFromService.result.append(node)

        node = ChartNodeModel(nodeID: 0, name: "Superman", starsQuantity: 2, color: "#00bcd4", imageID: "7", percentage: 0.0)
        dataFromService.result.append(node)

        node = ChartNodeModel(nodeID: 0, name: "Star", starsQuantity: 1, color: "#00bcd4", imageID: "7", percentage: 0.0)
        dataFromService.result.append(node)

        
        chart?.createChart(dataFromService)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    static func getCoreValueColorByName(name: String?) -> (color: UIColor, viewName: String) {
//        
//        var coreValueColor: (color: UIColor, viewName: String)?
//        switch name ?? "" {
//        case "Aim for Excellence in your Work":
//            //            coreValueColor = (color: UIColor(rgba: "#c2b9d6"), viewName: "aim-for-excellence-star-bubble")
//            coreValueColor = (color: UIColor(rgba: "#614c97"), viewName: "aim-for-excellence-star-bubble")
//        case "Constantly Innovate":
//            coreValueColor = (color: UIColor(rgba: "#223c90"), viewName: "constantly-innovate-star-bubble")
//        case "Have Fun":
//            coreValueColor = (color: UIColor(rgba: "#f5b60d"), viewName: "have-fun-star-bubble")
//        case "Think Big":
//            coreValueColor = (color: UIColor(rgba: "#de2d61"), viewName: "think-big-star-bubble")
//        case "Be a Team Player":
//            coreValueColor = (color: UIColor(rgba: "#008d80"), viewName: "team-player-star-bubble")
//        case "Act Ethically":
//            coreValueColor = (color: UIColor(rgba: "#6cb143"), viewName: "act-ethically-star-bubble")
//        default:
//            coreValueColor = (color: UIColor(rgba: "#00bcd4"), viewName: "skill-value-star-bubble")
//        }
//        return coreValueColor!
//    }


}

