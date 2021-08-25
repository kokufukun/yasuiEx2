//
//  ViewController.swift
//  Ex2
//
//  Created by 安井基哲 on 2021/08/25.
//

import UIKit

class ViewController: UIViewController {

    //テキストフィールド２つ
    @IBOutlet private weak var number1TextField: UITextField!
    @IBOutlet private weak var number2TextField: UITextField!

    //セグメントコントロール（選択 → ボタンで実行）
    @IBOutlet weak var selectCalcSegmentedControl: UISegmentedControl!

    //結果ラベル。初期表示は0.0
    @IBOutlet private weak var resultLabel: UILabel!

    //計算実行ボタン
    @IBAction func runCalcButton(_ sender: Any) {

        //セグメントコントロールのindexを取得
        let index = selectCalcSegmentedControl.selectedSegmentIndex

        //各String?をDouble?に変換しDoubleに変換。未入力や文字列が入力された際は０に変換
        let value1 = Double(number1TextField.text ?? "") ?? 0
        let value2 = Double(number2TextField.text ?? "") ?? 0

        //結果もDoubleで宣言。（switch文の中でresultを使用するため）
        var result : Double!

        //number2が未入力または0のとき、かつ、除算のときははじく
        if(value2 == 0 && index == 3){

            //エラー文
            resultLabel.text = "0での除算はできません"

        //実行できるとき
        }else{

            //indexが、0,1,2,3、でそれぞれ、加算、減算、乗算、除算。
            //defaultは使うことはない。しかし記述しないと構文エラーになる。
            switch index {
            case 0:
                result = value1 + value2
                break;
            case 1:
                result = value1 - value2
                break;
            case 2:
                result = value1 * value2
                break;
            case 3:
                result = value1 / value2
                break;
            default:
                break;
            }

            //DoubleのresultをStringに変換
            resultLabel.text = String(result)
        }
    }
}

