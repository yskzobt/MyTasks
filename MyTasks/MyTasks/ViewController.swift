import UIKit
import PureLayout

class ViewController: UIViewController {
    private var inputForm = UIStackView.newAutoLayout()
    private var dateLabel: UILabel
    private var titleLabel: UILabel
    private var didSetupConstraints: Bool = false
    init(){
        dateLabel = UILabel()
        titleLabel = UILabel()
        
        super.init(nibName: nil, bundle: nil)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy/M/d(EEE)", options: 0, locale: Locale(identifier: "ja_JP"))
        
        dateLabel.text = dateFormatter.string(from: Date())
        dateLabel.textAlignment = NSTextAlignment.left
        dateLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        
        titleLabel.text = "xxxを購入する"
        titleLabel.textAlignment = NSTextAlignment.left
        titleLabel.font = UIFont.systemFont(ofSize: 20.0)
        
        view.addSubview(inputForm)
        inputForm.addArrangedSubview(dateLabel)
        inputForm.addArrangedSubview(titleLabel)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func updateViewConstraints() {
        if didSetupConstraints == false {
            inputForm.autoPinEdgesToSuperviewSafeArea(with: .zero, excludingEdge: .bottom)
            didSetupConstraints = true
        }
        super.updateViewConstraints()
    }

}

