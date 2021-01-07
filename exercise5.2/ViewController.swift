//
//  ViewController.swift
//  exercise5.2
//
//  Created by Scores_Main_User on 1/6/21.
//


//The view should have a minimum width and height - 50x25

//The view should have a maximum width and height - 300x60
//
//The view’s size should be derived from the label’s text
//
//The label should have minimum padding of 8pt from all view’s edges




import UIKit

class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        let myView = UIView()
        myView.backgroundColor = .red
        self.view.addSubview(myView)
       
     
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.widthAnchor.constraint(lessThanOrEqualToConstant: 300).isActive = true
        myView.heightAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
        myView.widthAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        myView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        myView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        myView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true



        let label = VerticalTopAlignLabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        myView.addSubview(label)
        label.text = "aaaa"
        label.textColor = .black
        label.numberOfLines = 0

    
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 8).isActive = true
        label.topAnchor.constraint(equalTo: myView.topAnchor, constant: 8).isActive = true
        label.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -8).isActive = true
        label.bottomAnchor.constraint(equalTo: myView.bottomAnchor, constant: -8).isActive = true
        


    }


}

class VerticalTopAlignLabel: UILabel {

    override func drawText(in rect:CGRect) {
        guard let labelText = text else {  return super.drawText(in: rect) }

        let attributedText = NSAttributedString(string: labelText, attributes: [NSAttributedString.Key.font: font ?? "error"])
        var newRect = rect
        newRect.size.height = attributedText.boundingRect(with: rect.size, options: .usesLineFragmentOrigin, context: nil).size.height

        if numberOfLines != 0 {
            newRect.size.height = min(newRect.size.height, CGFloat(numberOfLines) * font.lineHeight)
        }

        super.drawText(in: newRect)
    }

}

