//
//  ViewController.swift
//  Ex2
//
//  Created by 安井基哲 on 2021/08/25.
//

import UIKit

class ViewController: UIViewController {

    // テキストフィールド２つ
    @IBOutlet private weak var number1TextField: UITextField!
    @IBOutlet private weak var number2TextField: UITextField!

    // セグメントコントロール（選択 → ボタンで実行）
    @IBOutlet private weak var selectCalcSegmentedControl: UISegmentedControl!

    // 結果ラベル。初期表示は0.0
    @IBOutlet private weak var resultLabel: UILabel!

    // 計算実行ボタン
    @IBAction private func runCalcButton(_ sender: Any) {

        // セグメントコントロールのindexを取得
        let index = selectCalcSegmentedControl.selectedSegmentIndex

        // 各String?をDouble?に変換しDoubleに変換。未入力や文字列が入力された際は０に変換
        let value1 = Double(number1TextField.text ?? "") ?? 0
        let value2 = Double(number2TextField.text ?? "") ?? 0

        let result: String

        switch index {
        case 0:
            result = String(value1 + value2)
        case 1:
            result = String(value1 - value2)
        case 2:
            result = String(value1 * value2)
        case 3:
            if value2 == 0 {
                result = "0での除算はできません"
            } else {
                result = String(value1 / value2)
            }
        default:
            return
        }

        // DoubleのresultをStringに変換
        resultLabel.text = String(result)
    }
}
