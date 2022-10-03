//
//  ViewController.swift
//  MonthPagination
//
//  Created by David Iordan on 9/22/22.
//

import UIKit

class ViewController: UIViewController {

    let carbonData: [CarbonData] = [
        CarbonData(month: "May", inputValues: [CarbonInputValue(value: 125, color: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)),
                                               CarbonInputValue(value: 28, color: #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)),
                                               CarbonInputValue(value: 83, color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)),
                                               CarbonInputValue(value: 67, color: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1))]),
        CarbonData(month: "June", inputValues: [CarbonInputValue(value: 25, color: #colorLiteral(red: 0.1114191785, green: 0.4056661725, blue: 0.3467503786, alpha: 1)),
                                                CarbonInputValue(value: 128, color: #colorLiteral(red: 0.8375214338, green: 0.8034436107, blue: 0.6447689533, alpha: 1)),
                                                CarbonInputValue(value: 183, color: #colorLiteral(red: 0.7753291726, green: 0.5383309722, blue: 0.7775710821, alpha: 1)),
                                                CarbonInputValue(value: 167, color: #colorLiteral(red: 0.237870127, green: 0.5116240382, blue: 0.3793785572, alpha: 1))]),
        CarbonData(month: "July", inputValues: [CarbonInputValue(value: 45, color: #colorLiteral(red: 0.2779035568, green: 0.1750825942, blue: 0.175825417, alpha: 1)),
                                                CarbonInputValue(value: 37, color: #colorLiteral(red: 0.2482305765, green: 0.3064138293, blue: 0.3100078404, alpha: 1)),
                                                CarbonInputValue(value: 113, color: #colorLiteral(red: 0.5271926522, green: 0.5015951395, blue: 0.3700631261, alpha: 1)),
                                                CarbonInputValue(value: 177, color: #colorLiteral(red: 0.6531909108, green: 0.4761924744, blue: 0.4734983444, alpha: 1))]),
        CarbonData(month: "August", inputValues: [CarbonInputValue(value: 105, color: #colorLiteral(red: 0.9101853967, green: 0.2262151837, blue: 0.07913453132, alpha: 1)),
                                                  CarbonInputValue(value: 98, color: #colorLiteral(red: 0.6227928996, green: 0.7539737821, blue: 0.5331030488, alpha: 1)),
                                                  CarbonInputValue(value: 123, color: #colorLiteral(red: 0.67986691, green: 0.543409586, blue: 0.4510827065, alpha: 1)),
                                                  CarbonInputValue(value: 17, color: #colorLiteral(red: 0.2274121642, green: 0.2195762694, blue: 0.2701071501, alpha: 1))]),
        CarbonData(month: "September", inputValues: [CarbonInputValue(value: 159, color: #colorLiteral(red: 0.2114315927, green: 0.6811532974, blue: 0.4868521094, alpha: 1)),
                                                     CarbonInputValue(value: 89, color: #colorLiteral(red: 0.975302279, green: 0.8532179594, blue: 0.136372149, alpha: 1)),
                                                     CarbonInputValue(value: 164, color: #colorLiteral(red: 0.9211297631, green: 0.3235977292, blue: 0.3270062208, alpha: 1)),
                                                     CarbonInputValue(value: 67, color: #colorLiteral(red: 0.09396480769, green: 0.4531816244, blue: 0.5955317616, alpha: 1))]),
        CarbonData(month: "October", inputValues: [CarbonInputValue(value: 89, color: #colorLiteral(red: 0.5465599895, green: 0.73895365, blue: 0.8000987172, alpha: 1)),
                                                   CarbonInputValue(value: 17, color: #colorLiteral(red: 0.02267584577, green: 0.1577858925, blue: 0.2387988567, alpha: 1)),
                                                   CarbonInputValue(value: 133, color: #colorLiteral(red: 0.3602576256, green: 0.1820342839, blue: 0.4956490397, alpha: 1)),
                                                   CarbonInputValue(value: 97, color: #colorLiteral(red: 0.2985936701, green: 0.4050273597, blue: 0.5753484368, alpha: 1))])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.95, alpha: 1)

        let monthNavigationView = CarbonChartNavigableView(carbonData: carbonData)
        view.addSubview(monthNavigationView)

        NSLayoutConstraint.activate([
            monthNavigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            monthNavigationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            monthNavigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            monthNavigationView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

struct CarbonData {
    let month: String
    let inputValues: [CarbonInputValue]

    init(month: String, inputValues: [CarbonInputValue]) {
        self.month = month
        self.inputValues = inputValues
    }
}

struct CarbonInputValue {
    let value: Double
    let color: UIColor

    init(value: Double, color: UIColor) {
        self.value = value
        self.color = color
    }
}
