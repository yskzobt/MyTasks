import UIKit
import PureLayout
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    private var inputForm = UIStackView.newAutoLayout()
    private var dateLabel: UILabel
    private var taskList: UITableView
    private var didSetupConstraints: Bool = false
    private var taskTitles = ["xxxを購入する", "yyyを入手する"]
    var fetchedArray: [Task] = []
    
    init(){
        dateLabel = UILabel()
        taskList = UITableView.newAutoLayout()
        
        super.init(nibName: nil, bundle: nil)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy/M/d(EEE)", options: 0, locale: Locale(identifier: "ja_JP"))
        
        dateLabel.text = dateFormatter.string(from: Date())
        dateLabel.textAlignment = NSTextAlignment.left
        dateLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        
        view.addSubview(inputForm)
        inputForm.addArrangedSubview(dateLabel)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        taskList.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        taskList.delegate = self
        taskList.dataSource = self
        view.addSubview(taskList)
        
    }

    override func updateViewConstraints() {
        if didSetupConstraints == false {
            inputForm.autoPinEdgesToSuperviewSafeArea(with: .zero, excludingEdge: .bottom)
            taskList.autoPinEdgesToSuperviewEdges()
            didSetupConstraints = true
        }
        super.updateViewConstraints()
    }
    
    func tableView(_ taskList: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return fetchedArray.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                                  for: indexPath)
        let tasks = fetchedArray[indexPath.row]
        if let title = tasks.title{
            cell.textLabel?.text = title
        }
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Task")
        do {
            fetchedArray = try managedContext.fetch(fetchRequest as! NSFetchRequest<NSFetchRequestResult>) as! [Task]
        } catch let error as NSError {
            print("Could not fetch. ¥(error), ¥(error.userInfo)")
        }
    }
    
    func refreshTableView(){
        taskList.reloadData()
    }

}
