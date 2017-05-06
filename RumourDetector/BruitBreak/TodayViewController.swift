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
import NVActivityIndicatorView
enum resultType: Int {
    case truth = 0
    case rumour = 1
    case unknown = 2
}

class TodayViewController: UIViewController, NCWidgetProviding {
    fileprivate var graphView: Piechart!
    fileprivate var copiedString: String!
    fileprivate var emptyView: UIView!
    fileprivate var loadingView: NVActivityIndicatorView!
   
    fileprivate var contentView: UIView!
    fileprivate var lineSeperator: UIView!
    fileprivate var lineSeperatorEnd: UIView!
    fileprivate var truthView: InfoView!
    fileprivate var rumourView: InfoView!
    fileprivate var unknownView: InfoView!

    fileprivate var statsTitleLabel: UILabel! {
        didSet {
            statsTitleLabel.textColor = UIColor.textHighLightColor()
            statsTitleLabel.font = UIFont(name: "BebasNeue", size: 10)
            statsTitleLabel.lineBreakMode = .byWordWrapping
            statsTitleLabel.numberOfLines = 0
            statsTitleLabel.textAlignment = .center
        }
    }
    
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
        contentView = UIView()
        view.addSubview(contentView)
        
        graphView = Piechart()
        graphView.info = ""
        graphView.backgroundColor = UIColor.clear
        graphView.isHidden = true
        contentView.addSubview(graphView)
        
        statsTitleLabel = UILabel()
        contentView.addSubview(statsTitleLabel)
        
        lineSeperator = UIView()
        lineSeperator.backgroundColor = UIColor.appThemeGreyColor()
        contentView.addSubview(lineSeperator)
        
        lineSeperatorEnd = UIView()
        lineSeperatorEnd.backgroundColor = UIColor.cellSeparatorDarkColor()
        contentView.addSubview(lineSeperatorEnd)
        
        truthView = InfoView()
        contentView.addSubview(truthView)

        rumourView = InfoView()
        contentView.addSubview(rumourView)
        
        unknownView = InfoView()
        contentView.addSubview(unknownView)
        
        loadingView = NVActivityIndicatorView(frame: CGRect(x:7.5,y:7.5,width:100,height:100), type: .ballClipRotatePulse, color: UIColor.loaderColor(), padding: 0.0)
        graphView.addSubview(loadingView)

        emptyView = UIView()
        emptyView.isHidden = true
        view.addSubview(emptyView)
        
        emptyDescLabel = UILabel()
        emptyView.addSubview(emptyDescLabel)
        
        
    }
    
    fileprivate func initConstraints() {
        let margin: CGFloat = 15
        let viewHeight: CGFloat = 15
        
        
        constrain(view, contentView, loadingView) { root, content, loader in
            fill(content, superview: root)
        }
        
        constrain(contentView, statsTitleLabel, lineSeperator, graphView, lineSeperatorEnd) { root, title, line, graph, lineEnd in
           
            graph.left == root.left + margin/2
            graph.top == root.top + margin/2
            graph.width == 100
            graph.height == 100
            
            title.top == root.top + margin/2
            title.left == graph.right + margin
            title.right == root.right - margin
            title.bottom == graph.bottom / 2
            
            line.top == title.bottom + 3
            line.height == 2
            line.left == title.left
            line.right == title.right
           
            lineEnd.top == graph.bottom - 3
            lineEnd.height == 0
            lineEnd.left == title.left
            lineEnd.right == title.right
        }

        constrain(lineSeperator, graphView, truthView, rumourView, unknownView) { line, graph , truth, rumour, unknown  in
            
            truth.height == viewHeight
            truth.left == line.left
            truth.right == line.right
            truth.top == line.bottom + 3
            
            rumour.top == truth.bottom
            rumour.left == truth.left
            rumour.right == truth.right
            rumour.height == viewHeight
            
            unknown.top == rumour.bottom
            unknown.left == rumour.left
            unknown.right == rumour.right
            unknown.height == viewHeight
        }
       
        constrain(contentView, graphView, loadingView) { root, graph, loader in
            loader.top == graph.top
            loader.left == graph.left
            loader.right == graph.right
            loader.bottom == graph.bottom
            loader.center == graph.center
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
            loadingView.startAnimating()
            
            statsTitleLabel.text = copiedString
            
            graphView.title = ""
            graphView.subtitle = ""

            sendStringtoServer(searchText: copiedString)
        }
        else{
            emptyView.isHidden = false
        }
    }
    
    func sendStringtoServer(searchText: String) {
        
        T365APIRequest.sharedAPI.getValue(text: searchText) { (success, rumour, error) in
            DispatchQueue.main.async {
                
                if success {
                    if let data = rumour {
                        self.renderData(rumour: data)
                    }
                    self.loadingView.stopAnimating()
                    
                }else{
                    print(error ?? "Error")
                    self.emptyView.isHidden = false
                    self.contentView.isHidden = true
                    self.loadingView.stopAnimating()
                }
            }
        }
    }
    
    func renderData(rumour: rumourStats) {
        
        
        let factPercentage = Float(round(rumour.factPercentage ))
        let rumourPercentage = Float(round(rumour.hoaxPercentage ))
        let unknownPercentage = Float(round(rumour.unknownPercentage ))

        statsTitleLabel.text = String(format:"\"%@\"", copiedString)
        truthView.render("Fact", subtitle: String(format:"%.f %@", factPercentage,"%"), mode:.truth)
        rumourView.render("Bruit", subtitle: String(format:"%.f %@", rumourPercentage,"%"), mode:.rumour)
        unknownView.render("Unknown", subtitle: String(format:"%.f %@", unknownPercentage, "%"), mode:.unknown)
        
        var fact = Piechart.Slice()
        fact.value = CGFloat(rumour.factPercentage)
        fact.color = UIColor.graphFactColor()
        
        var rumourSlice = Piechart.Slice()
        rumourSlice.value = CGFloat(rumour.hoaxPercentage)
        rumourSlice.color = UIColor.graphRumourColor()
        
        var unknown = Piechart.Slice()
        unknown.value = CGFloat(rumour.unknownPercentage)
        unknown.color = UIColor.graphGreyColor()
        
        graphView.slices = [fact, rumourSlice, unknown]
       
        //Temp Fixes
        if rumour.statusText == "hoax" {
            graphView.title = "\(rumourPercentage)%"
            graphView.subtitle = "Bruit"
        }else if rumour.statusText == "fact"{
            graphView.subtitle = "FACT"
            graphView.title = "\(factPercentage)%"
        }
        else if rumour.statusText == "unknown" {
            graphView.subtitle = "UNKNOWN"
            graphView.title = "\(unknownPercentage)%"
        }
        // Load Graph View
        DispatchQueue.main.async {
            self.graphView.click()
        }
    }
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error//is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}


class InfoView: UIView {
    fileprivate var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = UIColor.textHighLightColor()
            titleLabel.font = UIFont(name: "BebasNeue", size: 14)
        }
    }
    fileprivate var subTitleLabel: UILabel! {
        didSet {
            subTitleLabel.textColor = UIColor.textHighLightColor()
            subTitleLabel.font = UIFont(name: "BebasNeue", size: 14)
        }
    }
    fileprivate var kindIcon: UIImageView!
    fileprivate var lineSeperator: UIView!
    private var leftConstrain: NSLayoutConstraint!
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
        initConstraints()
        
    }
    
    required internal init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func initViews() {
        backgroundColor = UIColor.clear
        
        titleLabel = UILabel()
        addSubview(titleLabel)
        
        subTitleLabel = UILabel()
        addSubview(subTitleLabel)
        
        lineSeperator = UIView()
        lineSeperator.backgroundColor = UIColor.cellSeparatorDarkColor()
        addSubview(lineSeperator)
    }
    
    fileprivate func initConstraints() {
        constrain(self, titleLabel, subTitleLabel) { root, title, subtitle in
            leftConstrain = title.left == root.left
            title.centerY == root.centerY
            
            subtitle.centerY == root.centerY
            subtitle.right == root.right
        }
    }
    
    func render(_ title: String, subtitle: String, mode:resultType) {
        titleLabel.text = title
        subTitleLabel.text = subtitle

        switch mode {
        case .truth:
            titleLabel.textColor = UIColor.graphFactColor()
        case .rumour:
            titleLabel.textColor = UIColor.graphRumourColor()
        case .unknown:
            titleLabel.textColor = UIColor.appThemeGreyColor()

        }
    }
    
    func render(_ title: String, subtitle: String, image: UIImage) {
        titleLabel.text = title
        subTitleLabel.text = subtitle
        
        kindIcon = UIImageView()
        kindIcon.image = image
        addSubview(kindIcon)
        
        constrain(self, kindIcon) { root, icon in
            icon.width == 14
            icon.height == 14
            icon.left == root.left
            icon.centerY == root.centerY
            
        }
        //  leftConstrain.constant += 10
    }
}


public func fill(_ view: LayoutProxy, superview: LayoutProxy) {
    view.top == superview.top
    view.left == superview.left
    view.right == superview.right
    view.bottom == superview.bottom
}
