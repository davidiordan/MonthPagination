//
//  MonthNavigationView.swift
//  MonthPagination
//
//  Created by David Iordan on 9/22/22.
//

import Charts
import UIKit

class CarbonChartNavigableView: UIStackView {
    let randomWords: [String] = [
        "premium",
        "acid",
        "eyes",
        "cake",
        "cup",
        "overjoyed",
        "snakes",
        "broken",
        "able",
        "base",
        "grey",
        "desire",
        "park",
        "calculate",
        "linen",
        "chase",
        "tawdry",
        "battle",
        "observation",
        "crow"
    ]

    lazy var navigationLabelStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false

        stack.addArrangedSubview(backCaretButton)
        stack.addArrangedSubview(monthLabel)
        stack.addArrangedSubview(forwardCaretButton)

        return stack
    }()

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

        return label
    }()

    lazy var pieChartView: PieChartView = {
        let chart = PieChartView()
        chart.isUserInteractionEnabled = false
        chart.holeRadiusPercent = 0.7
        chart.holeColor = .clear
        chart.legend.enabled = false
        chart.drawEntryLabelsEnabled = true
        chart.entryLabelColor = .black
        chart.translatesAutoresizingMaskIntoConstraints = false
        chart.chartDescription = Description()

        return chart
    }()

    var presentedDateIndex: Int
    let carbonData: [CarbonData]

    init(carbonData: [CarbonData]) {
        self.carbonData = carbonData
        self.presentedDateIndex = carbonData.count - 1

        super.init(frame: .zero)
        self.initCommon()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) not implemented")
    }

    private func initCommon() {
        axis = .vertical
        distribution = .fill
        alignment = .fill
        spacing = 8
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false

        backCaretButton.isEnabled = presentedDateIndex > 0
        forwardCaretButton.isEnabled = presentedDateIndex < carbonData.count - 1
        monthLabel.text = carbonData[presentedDateIndex].month

        backCaretButton.addTarget(self, action: #selector(navigateDateBackward), for: .touchUpInside)
        forwardCaretButton.addTarget(self, action: #selector(navigateDateForward), for: .touchUpInside)

        buildChart(with: carbonData[presentedDateIndex])

        addArrangedSubview(navigationLabelStack)
        addArrangedSubview(pieChartView)

        NSLayoutConstraint.activate([
            pieChartView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

    @objc private func navigateDateForward() {
        guard presentedDateIndex < carbonData.count - 1 else { return }

        backCaretButton.isEnabled = true
        presentedDateIndex += 1
        monthLabel.text = carbonData[presentedDateIndex].month
        buildChart(with: carbonData[presentedDateIndex])

        if presentedDateIndex == carbonData.count - 1 {
            forwardCaretButton.isEnabled = false
        }
    }

    @objc private func navigateDateBackward() {
        guard presentedDateIndex > 0 else { return }

        forwardCaretButton.isEnabled = true
        presentedDateIndex -= 1
        monthLabel.text = carbonData[presentedDateIndex].month
        buildChart(with: carbonData[presentedDateIndex])

        if presentedDateIndex == 0 {
            backCaretButton.isEnabled = false
        }
    }

    private func buildChart(with data: CarbonData) {
        let dataEntries = data.inputValues.map { PieChartDataEntry(value: $0.value, label: randomWords.randomElement()) }
        let dataSet = PieChartDataSet(entries: dataEntries)
        dataSet.setColors(data.inputValues.map { $0.color }, alpha: 1.0)
        dataSet.sliceSpace = 6.0
        dataSet.entryLabelColor = .black

        let chartData = PieChartData(dataSet: dataSet)
        chartData.setValueTextColor(.black)
        chartData.setDrawValues(true)

        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: numberFormatter)
        chartData.setValueFormatter(formatter)

        pieChartView.data = chartData
    }
}
