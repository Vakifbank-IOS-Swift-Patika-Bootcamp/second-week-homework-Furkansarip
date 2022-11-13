import Foundation


public protocol TransactionsZoo {
    func addIncome(incomeAmount:Double)
    func addExpense(expenseAmount:Double)
}

public protocol WaterSource {
    func increaseWater(increaseAmount:Double)
    func decreaseWater(decreaseAmount:Double)
}



public class Zoo : TransactionsZoo,WaterSource {
    
    var keeperList = [Keeper]()
    var animalList = [Animal]()
    var totalWater : Double
    var totalBudget : Double
    var salaryMultiplier : Double
    
    public init(totalWater:Double,totalBudget:Double,salaryMultiplier:Double) {
        self.totalWater = totalWater
        self.totalBudget = totalBudget
        self.salaryMultiplier = salaryMultiplier
    }
    
    public func addAnimal(animal:Animal){
        animalList.append(animal)
        let name = animal.animalName
        decreaseWater(decreaseAmount: animal.waterConsumption)
        print("New Animal : \(name) New Water Limit : \(totalWater)")
    }
    
    public func addKeeper(keeper:Keeper){
        keeperList.append(keeper)
    }
    
    public func addIncome(incomeAmount: Double) {
        totalBudget += incomeAmount
        print("After income last budget : \(totalBudget)")
    }
    
    public func addExpense(expenseAmount: Double) {
        totalBudget -= expenseAmount
        print("After expense last budget : \(totalBudget)")
        
    }
    
    public func increaseWater(increaseAmount: Double) {
        totalWater += increaseAmount
    }
    
    public func decreaseWater(decreaseAmount: Double) {
        totalWater -= decreaseAmount
    }
    
    public func calculateAndPayKeeperSalary(){
        var calculatedSalary = 0.0
        var totalPaidSalary = 0.0
        for keeper in keeperList {
            calculatedSalary = 0.0
            calculatedSalary = Double(keeper.getTotalAnimalTreatLevel() * keeper.animalList.count) * salaryMultiplier
            keeper.salary += calculatedSalary
            totalPaidSalary += calculatedSalary
        }
        print("Keepers Total Salary : \(totalPaidSalary)")
        addExpense(expenseAmount: totalPaidSalary)
    }
    
    
}

public class Animal  {
    var waterConsumption : Double
    var keeper : Keeper
    var animalName : String
    var animalTreatLevel : Int? {
        get {
            1
        }
    }
    public init(animalName:String,keeper:Keeper,waterConsumption:Double) {
        self.keeper = keeper
        self.animalName = animalName
        self.waterConsumption = waterConsumption
    }
    func animalVoice(){
        
    }
}

public class Cat : Animal {
    override var animalTreatLevel : Int {
        get {
            2
        }
    }
    override public func animalVoice(){
        print("Miyav")
    }
    
}

public class Dog : Animal {
    override var animalTreatLevel : Int {
        get {
            3
        }
    }
    override public func animalVoice(){
        print("Hav Hav")
    }
    
}

public class Donkey : Animal {
    override var animalTreatLevel : Int {
        get {
            4
        }
    }
    override public func animalVoice(){
        print("AI-AI")
    }
    
}

public class Cow : Animal {
    override var animalTreatLevel : Int {
        get {
            5
        }
    }
    override public func animalVoice(){
        print("MOOOO")
    }
    
}

public class Keeper {
    var animalList = [Animal]()
    var name : String
    var salary = 0.0
    public init(name:String){
        self.name = name
    }
    public func addAnimalForCare(animal : Animal){
        animalList.append(animal)
        //print("Keeper's animal list : \(animalList)")
        
    }
    public func listOfAnimal(){
        var animals = ""
        for i in animalList {
            animals += i.animalName + " "
        }
        print("\(name)'s animal list : \(animals)")
        
    }
    
    public func getTotalAnimalTreatLevel() -> Int{
        var totalTreat = 0
        
        for animal in animalList {
            totalTreat += animal.animalTreatLevel!
            
        }
        return totalTreat
    }
}
