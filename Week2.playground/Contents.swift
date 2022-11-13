import Foundation

var comp1 = Company(companyName: "Apple", totalBudget: 1000000, foundationDate: 1976)
var emp1 = JuniorEmployee(name: "Furkan", age: 25, martialStatus: "Single")
var emp2 = MiddleEmployee(name: "Taha", age: 30, martialStatus: "Married")
var emp3 = Employee(name: "Standard Employee", age: 20, martialStatus: "single")
comp1.addEmployeeToCompany(employee: emp1) // çalışanlar şirkete ekleniyor.
comp1.addEmployeeToCompany(employee: emp2)
comp1.addEmployeeToCompany(employee: emp3)
comp1.calculateAndPayEmployeeSalary { employeeList in
    print(employeeList)
} //Toplu maaş ödemesi
comp1.addExpense(expenseAmount: 10000000)//Bütçe aşımı olduğu için ödeme yapamıyor.




print("\nZoo App")
var zoo = Zoo(totalWater: 500, totalBudget: 100000, salaryMultiplier: 1000)//Su Miktarı, Bütçemiz ve bakıcılarımız için maaş katsayımız
print("\nKeeper1 Details \n")
var keeper1 = Keeper(name: "Furkan")
zoo.addKeeper(keeper: keeper1) // Bahçemizin yeni bir bakıcısı var
var cat = Cat(animalName:"Cat",keeper: keeper1, waterConsumption: 5)//Kedi su tüketimi ve bakıcısı eşleştirildi.
zoo.addAnimal(animal: cat) // Bahçemize kedi eklendi.
keeper1.addAnimalForCare(animal: cat) // Bakıcımız kediyle eşleşti.
cat.animalVoice()

var donkey = Donkey(animalName:"Donkey",keeper: keeper1, waterConsumption: 10)
zoo.addAnimal(animal: donkey)
keeper1.addAnimalForCare(animal: donkey)//Bakıcı 1'e donkey eklendi.
donkey.animalVoice()
keeper1.listOfAnimal() //Bakıcının sahip olduğu tüm hayvanları listeler.



print("\nKeeper2 Details \n")
var keeper2 = Keeper(name: "Taha")
zoo.addKeeper(keeper: keeper2)
var dog = Dog(animalName:"Dog",keeper: keeper2, waterConsumption: 7)
zoo.addAnimal(animal: dog)
keeper2.addAnimalForCare(animal: dog)
keeper2.listOfAnimal()
dog.animalVoice()

zoo.calculateAndPayKeeperSalary()// Bakım zorluk seviyesine göre maaş belirledim.Örnek;
//donkey 4 + cat 2 = 6 * hayvan sayısı * maaş katsayımız = 12000 şeklinde hesaplanıyor.Bizim iki bakıcımız var.
//İkinci bakıcımızıda ekleyince toplamda 15000 yapıyor.

