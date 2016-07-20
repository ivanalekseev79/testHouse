//
//  THWizardViewController.swift
//  testHouse
//
//  Created by Ivan Alekseev on 19.07.16.
//  Copyright © 2016 home. All rights reserved.
//

import UIKit
import SnapKit

class THWizardViewController: UIViewController {
    //MARK: static
    static let stepTitles = ["Создание плана","Монтаж/демонтаж","Указать стояк", "Расстановка мебели", "Расстановка осветительных приборов",""]

    //MARK: views
    var backgroundView = UIImageView()
    var stepTitleView = UILabel()
    var infoTitleView = UILabel()
    var panelView = UIView()
    var panelImageView = UIImageView()
    var editorButtonView = UIButton()
    var moveForwardButtonView = UIButton()
    var moveBackButtonView = UIButton()
    var burgerMenu = UIImageView()
    
    //MARK: overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    //MARK: setup views
    func setupView() {
        backgroundView = UIImageView(image: UIImage(named:"BG"))
        
        view.addSubview(backgroundView)
        
        backgroundView.snp_makeConstraints(closure:{(make) in
            make.edges.equalTo(view).inset(UIEdgeInsetsMake(-10, -10, -10, -10))
        })
        
        burgerMenu.image = UIImage(named: "BurgerMenu")
        burgerMenu.contentMode = .ScaleAspectFill
        
        view.addSubview(burgerMenu)
        
        burgerMenu.snp_makeConstraints { (make) in
            make.width.equalTo(26)
            make.height.equalTo(20)
            make.top.equalTo(view).offset(35)
            make.left.equalTo(view).offset(35)
        }
        
        setupHeader()
        setupImagePanel()
        setupEditButton()
        setupNavigationButtons()
    }
    
    func setupHeader() {
        stepTitleView.text = "Этап \(view.tag) из 6. \(THWizardViewController.stepTitles[view.tag-1])"
        stepTitleView.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.95)
        stepTitleView.font = UIFont(name: "Circe-Bold", size: 36)
        
        view.addSubview(stepTitleView)
        
        stepTitleView.snp_makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(view).offset(50)
        }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.75
        
        let attrString = NSMutableAttributedString(string: "Постройте план квартиры таким, какой он есть сейчас")
        attrString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range: NSMakeRange(0, attrString.length))
        
        infoTitleView.attributedText = attrString
        infoTitleView.textColor = UIColor(red: 23/255, green: 102/255, blue: 100/255, alpha: 1)
        infoTitleView.textAlignment = .Center
        infoTitleView.numberOfLines = 0
        
        infoTitleView.font = UIFont(name:"Circe", size: 24)
        
        view.addSubview(infoTitleView)
        
        infoTitleView.snp_makeConstraints { (make) in
            make.width.equalTo(400)
            make.top.equalTo(stepTitleView.snp_bottom).offset(10)
            make.centerX.equalTo(view)
        }
    }
    
    func setupImagePanel() {
        panelView.backgroundColor = UIColor.whiteColor()
        panelView.layer.shadowColor = UIColor.blackColor().CGColor
        panelView.layer.shadowOffset = CGSize(width: 10, height: 10)
        panelView.layer.cornerRadius = 20
        panelView.layer.shadowOpacity = 0.3
        panelView.layer.shouldRasterize = true
        panelView.layer.shadowRadius = 20
        
        view.addSubview(panelView)
        
        panelView.snp_makeConstraints { (make) in
            make.left.equalTo(view).offset(-20)
            make.top.equalTo(infoTitleView.snp_bottom).offset(30)
            make.height.equalTo(panelView.snp_width).dividedBy(1.333)
            //            make.bottom.equalTo(view).offset(-115)
            make.right.equalTo(view).offset(-400)
        }
        
        panelImageView.image = UIImage(named: "DemoPlan")
        panelImageView.contentMode = .ScaleAspectFill
        panelImageView.clipsToBounds = true
        
        panelView.addSubview(panelImageView)
        
        panelImageView.snp_makeConstraints { (make) in
            make.left.equalTo(panelView).offset(10)
            make.right.equalTo(panelView).offset(-10)
            make.top.equalTo(panelView).offset(10)
            make.height.equalTo(panelView).offset(-20)
            
        }
        
    }
    
    func setupEditButton() {
        editorButtonView.backgroundColor = UIColor(red: 45/255, green: 182/255, blue: 187/255, alpha: 1)
        editorButtonView.setTitle("ПЕРЕЙТИ \nК РЕДАКТОРУ", forState: .Normal)
        editorButtonView.titleLabel?.textAlignment = .Center
        editorButtonView.titleLabel?.numberOfLines = 0
        editorButtonView.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        editorButtonView.setTitleColor(UIColor.grayColor(), forState: .Highlighted)
        editorButtonView.titleLabel?.font = UIFont(name:"Circe-Bold", size: 18)
        
        editorButtonView.layer.cornerRadius = 36
        
        view.addSubview(editorButtonView)
        
        editorButtonView.snp_makeConstraints { (make) in
            make.width.equalTo(198)
            make.height.equalTo(71)
            make.centerY.equalTo(panelView)
            make.right.equalTo(view).offset(-116)
        }
        
        let borderView = UIView()
        borderView.translatesAutoresizingMaskIntoConstraints = false
        borderView.userInteractionEnabled = false
        
        view.addSubview(borderView)
        
        borderView.snp_makeConstraints { (make) in
            make.size.equalTo(editorButtonView).offset(CGSize(width: 46, height: 46))
            make.center.equalTo(editorButtonView)
        }
        
        borderView.setNeedsLayout()
        borderView.layoutIfNeeded()
        
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.bounds = borderView.bounds
        shapeLayer.position = CGPoint(x: borderView.bounds.width/2, y:borderView.bounds.height/2)
        shapeLayer.fillColor = UIColor.clearColor().CGColor
        shapeLayer.strokeColor = UIColor.whiteColor().CGColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineDashPattern = [12,12]
        shapeLayer.path = UIBezierPath(roundedRect: borderView.bounds, cornerRadius: 60).CGPath
        
        borderView.layer.addSublayer(shapeLayer)
    }
    
    func setupNavigationButtons() {
        if view.tag != 6 {
            moveForwardButtonView.titleLabel?.font = UIFont(name:"Circe-Regular", size: 18)
            moveForwardButtonView.setTitle("Этап \(view.tag+1) ", forState: .Normal)
            moveForwardButtonView.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            moveForwardButtonView.setTitleColor(UIColor.grayColor(), forState: .Highlighted)
            moveForwardButtonView.setImage(UIImage(named:"RightAngle"), forState: .Normal)
            
            moveForwardButtonView.transform = CGAffineTransformMakeScale(-1.0, 1.0)
            moveForwardButtonView.titleLabel?.transform = CGAffineTransformMakeScale(-1.0, 1.0)
            moveForwardButtonView.imageView?.transform = CGAffineTransformMakeScale(-1.0, 1.0)
            
            view.addSubview(moveForwardButtonView)
            moveForwardButtonView.snp_makeConstraints { (make) in
                make.bottom.equalTo(view).offset(-20)
                make.right.equalTo(view).offset(-30)
            }
            
            moveForwardButtonView.addTarget(self, action: #selector(self.moveForwardPressed(_:)), forControlEvents: .TouchUpInside)
        }
        
        if view.tag != 1 {
            moveBackButtonView.titleLabel?.font = UIFont(name:"Circe-Regular", size: 18)
            moveBackButtonView.setTitle(" Этап \(view.tag-1)", forState: .Normal)
            moveBackButtonView.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            moveBackButtonView.setTitleColor(UIColor.grayColor(), forState: .Highlighted)
            moveBackButtonView.setImage(UIImage(named:"RightAngle"), forState: .Normal)
            
            moveBackButtonView.imageView?.transform = CGAffineTransformMakeScale(-1.0, 1.0)
            
            view.addSubview(moveBackButtonView)
            moveBackButtonView.snp_makeConstraints { (make) in
                make.bottom.equalTo(view).offset(-20)
                make.left.equalTo(view).offset(30)
            }
            
            moveBackButtonView.addTarget(self, action: #selector(self.moveBackPressed(_:)), forControlEvents: .TouchUpInside)
        }
    }
    
    //MARK:  event handlers
    
    func moveForwardPressed(button: UIButton) {
        if let viewController = storyboard?.instantiateViewControllerWithIdentifier("wizardStep\(view.tag+1)") {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func moveBackPressed(button: UIButton) {
        navigationController?.popViewControllerAnimated(true)
    }

}
