import Foundation


// =================================
// MARK: - Task 3B
// =================================

/*
 Перепишите решение задачи 3 из классной работы для выполнения следующих условий:
 
 1. Ракета не может полететь, если нет экипажа. Всего экипаж - `5 человек`.
 Для работы с экипажем выполните следующие шаги:
 
 1.1. Создайте еnum Role, который будет описывать обязанности членов экипажа:
 - `Командир`,
 - `Штурман`,
 - `Механик`,
 - `Медик`,
 - `Инженер`,
 - `Повар`,
 - `Стюард/Стюардесса`
 - `Самозванец` (Imposter)
 Каждый член данного перечисления должен содержать `стаж работы` - Int.
 
 1.2. Реализуйте структуру `Член Экипажа`. Каждый член экипажа имеет:
 - имя (name),
 - роль (role)
 - возраст (age)
 
 1.3. Реализуйте свойство `Экипаж`, которое будет хратить массив членов экипажа.
 Сделайте это свойство доступным только для чтения.
 
 1.4. Для посадки каждого члена экипажа реализуйте отдельный метод.
 
 1.5. Ракета не может полететь, если при подготовке экипажа допущены ошибки.
 Реализуйте обработку следующих ошибок:
 
 - Если `Командира` и/или `Штурмана` нет на борту, даже если членов экипажа достаточно, ракета не полетит.
 Верните ошибку - какого члена экипажа не хватает.
 - Если не хватает членов экипажа, верните сообщение - сколько члено экипажа не хватает.
 - Если на борту `Самозванец` - ракету запускать нельзя! Верните ошибку!
 - Если стаж хоть одного члена экипажа менее 3х лет. Сообщите Командному центру кто это.
 
 !!! Для обработки ошибок связанных с членами экипажа, реализуйте enum `RocketStaffError` !!!
 !!! Сообщения об ошибках выводите через `NSLocalizedString` !!!
 
 
 
 2. Оборудуем ракету для перевозки пассажиров.
 Для этого:
 
 2.1. Создайте структуру `Пассажир`.
 Каждый пассажир имеет:
 - имя (name),
 - пол (gender),
 - возраст (age)
 - массу (weight)
 
 2.2. Для Ракеты реализуйте приватный массив Пассажиры, который будет принимать объекты типа Пассажир.
 
 2.3. Реализуйте методы, которые позволят сажать пассажиров на ракету, как группами, так и единичных пассажиров.
 
 2.2. Ракета может полететь, если:
 - Количество пассажиров не более 10 человек
 - Общая масса пассажиров не более 700 кг
 - Возраст каждого пассажира должен находиться в диапазоне 18 - 55 лет.
 
 2.3. Реализуйте обработку следующих ошибок:
 - Если возраст любого из пассажиров не соответсвует норме, верните ошибку, а также сообщите, какой пассажир не может полететь
 - Если количество пассажиров не соответсвует норме, верните соответствующую ошибку
 - Если масса всех пассажиров превышает норму, даже если их количество меньше установленной, верните ошибку
 
 !!! Для обработки ошибок связанных с пассажирами, реализуйте enum RocketPassengerError !!!
 !!! Сообщения об ошибках выводите через NSLocalizedString !!!
 
 
 
 3. Руководство Космопорта решило, что ракета должна перевозить грузы.
 Для этого давайте выполним следующие шаги:
 
 3.1. Реализуйте структуру `Груз`
 Каждый объект типа `Груз` должен иметь:
 - Название (subject) - String
 - Цель назначения (target) - String?
 - Свойства (properties)
 
 3.2. Для описания свойств `Груза` реализуйте `enum Properties`, где каждый элемент будет содержать:
 - массу (Float)
 - опастность груза (Bool)
 
 3.3. Реализуйте закрытое свойство `Грузовой отсек`, который будет хранить наши грузы. Доступно только для чтения.
 
 3.4. Реализуйте метод загрузки грузов в отсек.
 
 3.5. Ракета не может полететь, если не выполнены следующие нормы по перевозке грузов:
 - Если общая масса грузов превышает 1000 килограмм, верните ошибку и значение того, на сколько превышен вес.
 - Если на борту содержится хотя бы один опасный груз - при этом выведите все опасные грузы.
 - Если не указана цель назначения.
 - Если название попадает в список запрещенных.
 (Для этого можете создать произвольный список запрещаемых грузов)
 Не учитывайте регистр текста.
 
 !!! Для обработки ошибок связанных с пассажирами, реализуйте enum RocketCargoError !!!
 !!! Сообщения об ошибках выводите через NSLocalizedString !!!
 
 
 4. Предполетная подготовка. Ракета не полетит, если не выполнены требования ниже.
 Для этого придется расширить `RocketError`
 
 4.1. Вес пассажиров и груза превышает 1700 килограмм.
 4.2. Если ракета содержит топлива менее 5000 литров (не долетит), сообщите - сколько не хватает.
 4.3. Если при подготовке произошла неизвестная ошибка.
 
 !!! Сообщения об ошибках выводите через NSLocalizedString !!!
 */



// MARK: - Solution 3B
// Ваше решение можете реализовать тут

// MARK: - Енум ошибок
enum RocketError: Error {
    case invalidWeightRocket
    case invalidCountFuel(needed: Int)
    case unnownError
}

enum RocketStaffError: Error {
    case mainCrewMembersAreAbsent(member: String)
    case impostorOnBord
    case insufficientCrewMembers(needed: Int)
    case experienceIsTooShort(member: String)

}

enum RocketPassengerError: Error {
    case invalidCountOfPassangers
    case ageOfPassangerIsOut(passanger: String)
    case weightOfPassangersIsOut
}

enum RocketCargoError: Error {
    case invalidWeightGoods(weight: Float)
    case dangerGoods(danger: String)
    case invalidTarget
    case bannedGoods
}

// MARK: - Енум роли экипажа
enum Role: Int {
    case commander = 5
    case navigator = 4
    case mechanic = 7
    case medic = 6
    case engineer = 8
    case cook = 9
    case stewart = 10
    case impostor = 3
}

// MARK: - Структуры члена экипажа, пассажиров и груза
struct CrewMember {
    var name: String
    var role: Role
    var age: Int
}

struct Passanger {
    var name: String
    var gender: String
    var age: Int
    var weight: Double
}

struct Goods {
    enum Properties {
        case properties(massa: Float, danger: Bool)
    }

    var subject: String
    var target: String?
    var properties: Properties
}

// MARK: - Массивы членов экипажа, пассажиров и груза
private(set) var crew: [CrewMember] = [CrewMember(name: "David", role: Role.commander, age: 45),
                                       CrewMember(name: "Ralf", role: Role.cook, age: 35),
                                       CrewMember(name: "Charls", role: Role.engineer, age: 39),
                                       CrewMember(name: "Genry", role: Role.impostor, age: 29),
                                       CrewMember(name: "Marta", role: Role.mechanic, age: 33),
                                       CrewMember(name: "Stenly", role: Role.medic, age: 36),
                                       CrewMember(name: "Jef", role: Role.navigator, age: 31),
                                       CrewMember(name: "Christine", role: Role.stewart, age: 24)]

private var passangers: [Passanger] = [Passanger(name: "Genry", gender: "male", age: 20, weight: 78.5),
                                       Passanger(name: "Mark", gender: "male", age: 49, weight: 93),
                                       Passanger(name: "Stefan", gender: "male", age: 50, weight: 67),
                                       Passanger(name: "Sara", gender: "female", age: 19, weight: 39),
                                       Passanger(name: "Stefany", gender: "female", age: 34, weight: 50.1),
                                       Passanger(name: "Atrem", gender: "male", age: 23, weight: 82),
                                       Passanger(name: "Oleg", gender: "male", age: 32, weight: 79.9),
                                       Passanger(name: "Ivan", gender: "male", age: 24, weight: 93),
                                       Passanger(name: "Ruslan", gender: "male", age: 43, weight: 77),
                                       Passanger(name: "Olga", gender: "female", age: 19, weight: 48),
                                       Passanger(name: "Elena", gender: "female", age: 21, weight: 55.3),
                                       Passanger(name: "Anastasiya", gender: "female", age: 22, weight: 49),
                                       Passanger(name: "Kate", gender: "female", age: 54, weight: 53)]

private(set) var goodsHold: [Goods] = [Goods(subject: "Trees", target: "mebel", properties: .properties(massa: 200, danger: false)),
                                       Goods(subject: "Steel", target: "doors", properties: .properties(massa: 500, danger: false)),
                                       Goods(subject: "X-goods", target: nil, properties: .properties(massa: 100, danger: true)),
                                       Goods(subject: "Animals", target: nil, properties: .properties(massa: 50, danger: false))]

var bannedGoods: [String] = ["x-goods", "human", "animals"]
var mainStaff = [Role.commander, Role.navigator]

// MARK: - Метод создания экипажа
func crewRecruitment(_ array: inout [CrewMember], count: Int) -> [CrewMember] {
    var teamForFly: [CrewMember] = []
    array.shuffle()
    for i in 0...count - 1 {
        teamForFly.append(array[i])
    }
    return teamForFly
}
let staffCrew = crewRecruitment(&crew, count: 5)


// MARK: - Методы для создания команды пассажиров
func creatPassangersTeam(_ array: inout [Passanger], count: Int) -> [Passanger] {
    var teamForFly: [Passanger] = []
    array.shuffle()
    for i in 0...count - 1 {
        teamForFly.append(array[i])
    }
    return teamForFly
}

func creatPassanger(_ array: inout [Passanger]) -> Passanger {
    array.shuffle()
    let passanger: Passanger = array[0]
    return passanger
}
let passangerCrew = creatPassangersTeam(&passangers, count: 10)

// MARK: - Метод погрузки грузов
func creatGoodsHold(_ array: inout [Goods], count: Int) -> [Goods] {
    var goods: [Goods] = []
    array.shuffle()
    for i in 0...count - 1 {
        goods.append(array[i])
    }
    return goods
}
let goods = creatGoodsHold(&goodsHold, count: 2)

// MARK: - Метод для запуска ракеты
func startRocketIntoTheSpace(with crew: [CrewMember], with team: [Passanger], with goods: [Goods], fuel: Int) throws {
/// Условия для экипажа
    guard crew.contains(where: { $0.role == .commander }) else { throw RocketStaffError.mainCrewMembersAreAbsent(member: "Commander") }
    guard crew.contains(where: { $0.role == .navigator }) else { throw RocketStaffError.mainCrewMembersAreAbsent(member: "Navigator") }
    guard crew.count == 5 else { throw RocketStaffError.insufficientCrewMembers(needed: 5 - crew.count) }
    try crew.forEach {
        guard $0.role != Role.impostor else { throw RocketStaffError.impostorOnBord }
    }
    try crew.forEach {
        guard $0.role.rawValue > 3 else { throw RocketStaffError.experienceIsTooShort(member: $0.name) }
    }
/// Условия для пассажиров
    try team.forEach {
        guard $0.age > 18, $0.age < 55 else { throw RocketPassengerError.ageOfPassangerIsOut(passanger: $0.name) }
    }
    guard team.count <= 10 else { throw RocketPassengerError.invalidCountOfPassangers }
    var weightOfPassangers: Double = 0
    team.forEach { weightOfPassangers += $0.weight }
    guard weightOfPassangers < 700 else { throw RocketPassengerError.weightOfPassangersIsOut }
/// Условия для грузов
    var weightOfGoods: Float = 0
    goods.forEach {
        switch $0.properties {
        case .properties(let massa, _):
            weightOfGoods += massa
        }
    }
    guard weightOfGoods < 1000 else { throw RocketCargoError.invalidWeightGoods(weight: weightOfGoods - 1000) }
    try goods.forEach {
        switch $0.properties {
        case .properties(_, let danger):
            guard danger == false else { throw RocketCargoError.dangerGoods(danger: $0.subject) }
        }
    }
    try goods.forEach {
        guard $0.target != nil else { throw RocketCargoError.invalidTarget }
    }
    try goods.forEach {
        guard !bannedGoods.contains($0.subject.lowercased()) else { throw RocketCargoError.bannedGoods }
    }
/// Общие условия для ракеты
    let summWeight: Double = weightOfPassangers + Double(weightOfGoods)
    guard summWeight < 1700 else { throw RocketError.invalidWeightRocket }
    guard fuel >= 5000 else { throw RocketError.invalidCountFuel(needed: 5000 - fuel) }

    print("Ready! Steady! Поехали!")
}

// MARK: - Расширения для енумов ошибок
extension RocketError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidWeightRocket:
            return NSLocalizedString("Общий вес ракеты превышает допустимый!",
                                     comment: "")
        case .invalidCountFuel(needed: let needed):
            return NSLocalizedString("Количество топлива недостаточно! Необходимо еще: \(needed)",
                                     comment: "")
        case .unnownError:
            return NSLocalizedString("Неизвестная ошибка!",
                                     comment: "")
        }
    }
}

extension RocketStaffError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .mainCrewMembersAreAbsent(member: let member):
            return NSLocalizedString("Один из главных членов экипажа отсутствует: \(member)",
                                     comment: "")
        case .impostorOnBord:
            return NSLocalizedString("На борту самозванец!!!",
                                     comment: "")
        case .insufficientCrewMembers(needed: let needed):
            return NSLocalizedString("Недостаточное количество членов экипажа! Необходимо еще: \(needed)",
                                     comment: "")
        case .experienceIsTooShort(member: let member):
            return NSLocalizedString("Опыт полетов одного из членов экипажа недостаточен!! Это: \(member)",
                                     comment: "")
        }
    }
}

extension RocketPassengerError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidCountOfPassangers:
            return NSLocalizedString("Количество пассажиров превышено!!",
                                     comment: "")
        case .ageOfPassangerIsOut(passanger: let passanger):
            return NSLocalizedString("Возраст некоторых пассажиров выходит за рамки! Пассажир: \(passanger)",
                                     comment: "")
        case .weightOfPassangersIsOut:
            return NSLocalizedString("Вес пассажиров превышает максимальный!",
                                     comment: "")
        }
    }
}

extension RocketCargoError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidWeightGoods(weight: let weight):
            return NSLocalizedString("Вес груза превышен на \(weight) кг!",
                                     comment: "")
        case .dangerGoods(danger: let danger):
            return NSLocalizedString("На борту опасный груз - \(danger)!!",
                                     comment: "")
        case .invalidTarget:
            return NSLocalizedString("На борту груз без назначения!!",
                                     comment: "")
        case .bannedGoods:
            return NSLocalizedString("На борту запрещенный груз!!",
                                     comment: "")
        }
    }
}
do {
    try startRocketIntoTheSpace(with: staffCrew, with: passangerCrew, with: goods, fuel: 6000)
} catch {
    print(error.localizedDescription)
}
// =================================
// MARK: - Task 4B
// =================================

/*
 Перепишите решение задачи 4 из классной работы для выполнения следующих условий:
 
 1. Username пользователя должен быть длиной не менее 8 символов и не длиннее 20ти. Верните соответствующее сообщение.
 
 2. Username должен содержать хотя бы одну Заглавную букву, хотя бы одну цифру и символ "-".
 Укажите пользователю, какой символ в имени не подходит.
 
 3. Username не может состоять только из цифр. Верните соответствующее сообщение.
 
 4. Username не может состоять только из Заглавных букв. Верните соответствующее сообщение.
 
 5. Символы, кроме "-", запрещены! Верните соответствующее сообщение.
 
 6. Username не может начинаться с символа "-" или цифры. Верните соответствующее сообщение.
 
 7. Username не может заканчиваться на символ "-". Верните соответствующее сообщение.
 
 Для каждой конкретной ситуации реазуйте возврат ошибки, в понятном и очевидном виде для пользователя.
 Воспользуйтесь `NSLocalizedString`
 
 */
// MARK: - Solution 4B
// Ваше решение можете реализовать тут

enum UserNameError: Error {
    case invalidLenghtUserName
    case invalidUpperChar
    case invalidNumChar
    case invalidSympolChar
    case notOnlyNums
    case notOnlyUpper
    case invalidSymbols
    case invalidStartUserName
    case invalidFinishUserName
}

func creatUserName(name: String) throws {
    guard name.count > 8, name.count < 20 else { throw UserNameError.invalidLenghtUserName }
    guard Array(name).contains(where: { $0.isUppercase }) else { throw UserNameError.invalidUpperChar }
    guard Array(name).contains(where: { $0.isNumber }) else { throw UserNameError.invalidNumChar }
    guard Array(name).contains("-") else { throw UserNameError.invalidSympolChar }
    guard Array(name).contains(where: { $0.isLetter }) else { throw UserNameError.notOnlyNums }
    guard Array(name).contains(where: { $0.isLowercase }) else { throw UserNameError.notOnlyUpper }
    try Array(name).forEach {
        if $0.isSymbol, $0 != "-" { throw UserNameError.invalidSymbols }
    }
    guard !Array(name)[0].isNumber && Array(name)[0] != "-" else { throw UserNameError.invalidStartUserName }
    guard Array(name)[name.count - 1] != "-" else { throw UserNameError.invalidFinishUserName }
    
    print("Ваше имя успешно добавлено!")
}

extension UserNameError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidLenghtUserName:
            return NSLocalizedString("Неверная длина имени.",
                                     comment: "")
        case .invalidUpperChar:
            return NSLocalizedString("Имя должно содержать как минимум 1 заглавную букву.",
                                     comment: "")
        case .invalidNumChar:
            return NSLocalizedString("Имя должно содержать как минимум 1 цифру.",
                                     comment: "")
        case .invalidSympolChar:
            return NSLocalizedString("Имя должно содержать символ '-'.",
                                     comment: "")
        case .notOnlyNums:
            return NSLocalizedString("Имя не может содержать только цифры",
                                     comment: "")
        case .notOnlyUpper:
            return NSLocalizedString("Имя не может содержать все заглавные буквы",
                                     comment: "")
        case .invalidSymbols:
            return NSLocalizedString("Символы, кроме '-', запрещены.",
                                     comment: "")
        case .invalidStartUserName:
            return NSLocalizedString("Имя не может начинаться с символа '-' или цифры.",
                                     comment: "")
        case .invalidFinishUserName:
            return NSLocalizedString("Имя не может заканчиваться на символ '-'.",
                                     comment: "")
        }
    }
}
do {
    try creatUserName(name: "asDjg-1238j")
} catch {
    print(error.localizedDescription)
}
