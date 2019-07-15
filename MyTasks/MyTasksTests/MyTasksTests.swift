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

        }
    }

}
