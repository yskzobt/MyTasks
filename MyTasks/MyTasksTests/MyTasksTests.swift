import XCTest
import Nimble
import Quick
import Succinct
@testable import MyTasks

class MyTasksTest: QuickSpec{
    override func spec() {
        
        it("一覧画面に日付が表示されること"){
            let viewController = ViewController()
            expect(viewController.hasLabel(withExactText: "2019/6/23(Sun)")).to(beTrue())
            
        }
        
        it("一覧画面に今日の日付が表示されること"){
            let viewController = ViewController()
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            dateFormatter.timeStyle = .none
            dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy/M/d(EEE)", options: 0, locale: Locale(identifier: "ja_JP"))
            expect(viewController.hasLabel(withExactText: dateFormatter.string(from: Date()))).to(beTrue())
        }
        
        it("一覧画面にタスクのタイトルが1つ表示されること"){
            let viewController = ViewController()
            expect(viewController.hasLabel(withExactText: "xxxを購入する")).to(beTrue())
            
        }
        
        it("一覧画面にタスクのタイトルが2つ表示されること"){
            let viewController = ViewController()
            expect(viewController.hasLabel(withExactText: "yyyを入手する")).to(beTrue())

        }
        
        it("tableViewが表示されること") {
            let tableView = UITableView()
            expect(tableView).notTo(beNil())
        }
    }

}
