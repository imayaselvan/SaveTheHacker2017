//
//  TodayViewController.swift
//  BruitBreak
//
//  Created by Imayaselvan Ramakrishnan on 5/6/17.
//  Copyright © 2017 Imayaselvan. All rights reserved.
//

import UIKit
import NotificationCenter
import Cartography

class TodayViewController: UIViewController, NCWidgetProviding {
    fileprivate var graphView: Piechart!
    fileprivate var copiedString: String!
    fileprivate var emptyView: UIView!
    fileprivate var emptyDescLabel: UILabel! {
        didSet {
            emptyDescLabel.textColor = UIColor.textHighLightColor()
            emptyDescLabel.font = UIFont(name: "BebasNeue", size: 25)
            emptyDescLabel.lineBreakMode = .byWordWrapping
            emptyDescLabel.numberOfLines = 0
            emptyDescLabel.text = "Simply copy a text,and check here to identify the Truth."
            emptyDescLabel.textAlignment = .center
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        initConstraints()
        render()
    }
    
    func initViews() {
        graphView = Piechart()
        graphView.info = ""
        graphView.backgroundColor = UIColor.clear
        graphView.isHidden = true
        view.addSubview(graphView)
        
        emptyView = UIView()
        graphView.isHidden = true
        view.addSubview(emptyView)
        
        emptyDescLabel = UILabel()
        emptyView.addSubview(emptyDescLabel)
    }
    
    fileprivate func initConstraints() {
        let margin: CGFloat = 15
        constrain(view, graphView) { root, graph in
            graph.top == root.top
            graph.left == root.left + margin
            graph.width == 120
            graph.bottom == root.bottom
        }
        constrain(view, emptyView) { root, empty in
            empty.top == root.top
            empty.left == root.left
            empty.right == root.right
            empty.bottom == root.bottom
        }
        constrain(emptyView, emptyDescLabel) { root, empty in
            empty.top == root.top
            empty.left == root.left
            empty.right == root.right
            empty.bottom == root.bottom
            empty.center == root.center
        }
    }
    
    func render() {
        copiedString = UIPasteboard.general.string ?? " "
        if copiedString.words.count > 3 {
            emptyView.isHidden = true
            graphView.isHidden = false
            renderData()
        }
        else{
            emptyView.isHidden = false
        }
    }
    
    func renderData() {
        var farms = Piechart.Slice()
        farms.value = CGFloat(50)
        farms.color = UIColor.graphProspectColor()
        
        var zip = Piechart.Slice()
        zip.value = 0
        zip.color = UIColor.graphProspectColor()
        
        var county = Piechart.Slice()
        county.value = 0
        county.color = UIColor.graphProspectColor()
        
        var others = Piechart.Slice()
        others.value = CGFloat(100 - 50)
        others.color = UIColor.graphGreyColor()
        
        graphView.slices = [farms, zip, county, others]
        graphView.title = "\(50)%"
        graphView.subtitle = "Fact"
//        DispatchQueue.main.async {
//            self.graphView.click()
//        }
    }
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
