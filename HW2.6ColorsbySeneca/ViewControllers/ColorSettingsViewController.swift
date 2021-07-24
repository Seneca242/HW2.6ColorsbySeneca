//
//  ColorSettingsViewController.swift
//  HW2.6ColorsbySeneca
//
//  Created by Дмитрий Дмитрий on 24.07.2021.
//

import UIKit

class ColorSettingsViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var blueTF: UITextField!
    
    @IBOutlet var colorView: UIView!
    
    var delegate: ColorViewControllerDelegate!
    var colorForView: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        colorView.backgroundColor = colorForView
        
        colorView.layer.cornerRadius = 15
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
    
        redLabel.text = "Red"
        greenLabel.text = "Green"
        blueLabel.text = "Blue"
        
        assignColorForSliders()
        setValue(for: redValueLabel, greenValueLabel, blueValueLabel)
        setValue(for: redTF, greenTF, blueTF)
    }
    
    @IBAction func rgbAction(_ sender: UISlider) {
        
        setColor()
        
        switch sender {
        case redSlider:
            setValue(for: redValueLabel)
            setValue(for: redTF)
        case greenSlider:
            setValue(for: greenValueLabel)
            setValue(for: greenTF)
        default:
            setValue(for: blueValueLabel)
            setValue(for: blueTF)
        }
        
    }
    
    
    @IBAction func doneButtonPressed() {
        delegate?.assignColor(colorView.backgroundColor!)
        dismiss(animated: true)
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redValueLabel:
                label.text = string(from: redSlider)
            case greenValueLabel:
                label.text = string(from: greenSlider)
            default:
                label.text = string(from: blueSlider)
            }
        }
    }
    private func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTF: textField.text = string(from: redSlider)
            case greenTF: textField.text = string(from: greenSlider)
            default: textField.text = string(from: blueSlider)
            }
        }
    }
    
    private func assignColorForSliders() {
        let colorBreakDown = CIColor(color: colorForView)
        
        redSlider.value = Float(colorBreakDown.red)
        greenSlider.value = Float(colorBreakDown.green)
        blueSlider.value = Float(colorBreakDown.blue)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
}
