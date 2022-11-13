import Foundation

public protocol TransactionsCompany {
    func addIncome(incomeAmount:Double)
    func addExpense(expenseAmount:Double)
}

public class Company : TransactionsCompany {
   
    
    let companyName : String
    var totalBudget : Double
    let salaryMultiplier = 1000.0
    let foundationDate : Int
    var employeeList : [Employee] = []
    
    public init(companyName : String,totalBudget:Double,foundationDate:Int) {
        self.companyName = companyName
        self.totalBudget = totalBudget
        self.foundationDate = foundationDate
    }
    public func addIncome(incomeAmount: Double) {
        totalBudget += incomeAmount
        print("New Budget \(totalBudget)")
    }
    
    public func addExpense(expenseAmount: Double) {
        if expenseAmount > totalBudget{
            print("We are fail to pay.")
        }
        
        else if employeeList.count < 1 {
            totalBudget -= expenseAmount
            print("New Total Budget = \(totalBudget)")
        }
        else {
            totalBudget -= expenseAmount
            print("After paying all employees salary = \(totalBudget)")
        }
        
    }
    
    public func addEmployeeToCompany(employee:Employee){
        employeeList.append(employee)
    }
    
    
    public func calculateAndPayEmployeeSalary(_ completion: @escaping (_ employeeList:Employee)->Void){
        var calculatedSalary = 0.0
        var totalPaidSalary = 0.0
        for employee in employeeList {
            calculatedSalary = 0.0
            calculatedSalary = Double(employee.age) * employee.typeMultiplier * salaryMultiplier
            employee.addSalary(newSalary: calculatedSalary)
            totalPaidSalary += calculatedSalary
            
        }
        addExpense(expenseAmount: totalPaidSalary)
    }
    
    
    
    
}

public class Employee {
    let name : String
    let age : Int
    let martialStatus : String
    var salary = 0.0
    var typeMultiplier : Double {
        get {
            1.0
        }
    }
    
    public init(name:String,age:Int,martialStatus:String) {
        self.name = name
        self.age = age
        self.martialStatus = martialStatus
    }
    
    func addSalary(newSalary:Double){
        salary += newSalary
    }
}

public class JuniorEmployee : Employee {
    
    override var typeMultiplier : Double {
        get {
            2.0
        }
    }
    
}

public class MiddleEmployee : Employee {
    
    override var typeMultiplier : Double {
        get {
            3.0
        }
    }
    
}

public class SeniorEmployee : Employee {
    
    override var typeMultiplier : Double {
        get {
            4.0
        }
    }
    
}
