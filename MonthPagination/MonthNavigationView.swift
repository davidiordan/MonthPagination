//
//  MonthNavigationView.swift
//  MonthPagination
//
//  Created by David Iordan on 9/22/22.
//

import Charts
import UIKit

class CarbonChartNavigableView: UIStackView {
    lazy var backCaretButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.baseForegroundColor = UIColor(white: 0.15, alpha: 1)
        config.titleAlignment = .center
        config.image = UIImage(systemName: "chevron.left")
        config.imagePlacement = .trailing
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .large)

        let button = UIButton(type: .system)
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    lazy var forwardCaretButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.baseForegroundColor = UIColor(white: 0.15, alpha: 1)
        config.titleAlignment = .center
        config.image = UIImage(systemName: "chevron.right")
        config.imagePlacement = .leading
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .large)

        let button = UIButton(type: .system)
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    lazy var monthLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = presentedDate

        return label
    }()

    lazy var pieChartView: PieChartView = {
        let chart = PieChartView()
        chart.isUserInteractionEnabled = false
        chart.holeRadiusPercent = 0.7
        chart.holeColor = .clear
        chart.legend.enabled = false
        chart.drawEntryLabelsEnabled = false

        return chart
    }()

    var presentedDate: String
    let carbonData: [CarbonData]

    init(carbonData: [CarbonData]) {
        self.carbonData = carbonData
        self.presentedDate = carbonData[carbonData.count - 1].month

        super.init(frame: .zero)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) not implemented")
    }

    private func initCommon() {
        axis = .horizontal
        distribution = .fillEqually
        alignment = .center
        spacing = 8
        translatesAutoresizingMaskIntoConstraints = false

        backCaretButton.addTarget(self, action: #selector(navigateDateBackward), for: .touchUpInside)
        forwardCaretButton.addTarget(self, action: #selector(navigateDateForward), for: .touchUpInside)

        addArrangedSubview(backCaretButton)
        addArrangedSubview(monthLabel)
        addArrangedSubview(forwardCaretButton)

        // in here need to build out the pie chart using carbonData[presentedDate]
        // also need to disable the forward caret in order to ensure the user doesn't
        // go into the future for a value that doesn't exist
    }

    @objc private func navigateDateForward() {
        //
    }

    @objc private func navigateDateBackward() {
        //
    }
}
