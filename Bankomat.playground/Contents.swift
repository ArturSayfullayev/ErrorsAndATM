import UIKit
import Foundation

// MARK: - Енум ошибок
enum BankomatError: Error {
    case invalidPinCode
    case noCashInBankomat(needed: Double)
    case noCashInBalance(needed: Double)
    case invalidCurrency
}

// MARK: - Структура для создания карты
struct Card {
    let name: String
    let surname: String
    let pinCode: Int
    var balance: Double
}

// MARK: - Класс банкомата
class Bankomat {
    var currencyBalance: [String: Double] = ["blr": 1000,           // Различные валюты и их количество
                                             "usd": 400,
                                             "eur": 300,
                                             "rus": 10000]
    
    var enterPinCode: Int
    var card: Card
    
    init(card: Card, enterPinCode: Int) {
        self.card = card
        self.enterPinCode = enterPinCode
    }
    
    // MARK: - Метод для снятия наличных
    func getMoney(summ: Double, currency: String, closure: (Double, Double) -> Double) throws {
        guard self.currencyBalance.keys.contains(currency) else { throw BankomatError.invalidCurrency }
        guard card.balance > summ else { throw BankomatError.noCashInBalance(needed: summ - card.balance) }
        guard card.pinCode == enterPinCode else { throw BankomatError.invalidPinCode }
        guard self.currencyBalance[currency]! > summ else { throw BankomatError.noCashInBankomat(needed: self.currencyBalance[currency]! - summ) }
        
        self.currencyBalance[currency]! = closure(self.currencyBalance[currency]!, summ)
        card.balance = closure(card.balance, summ)
        print("Уважаемый \(card.surname) \(card.name)! Ваш баланс успешно изменился на \(Double(summ).rounded(toPlaces: 2)) рублей. На счету осталось \(Double(card.balance).rounded(toPlaces: 2)) рублей.")
    }
}

// MARK: - Расширения для Double, для мгновенной конвертации валюты
extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    var blr: Double {
        return self
    }
    var usd: Double {
        return self * 2.2
    }
    var eur: Double {
        return self * 3.1
    }
    var rus: Double {
        return self / 29
    }
}

// MARK: - Расширение для грамотного отображения ошибок
extension BankomatError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidPinCode:
            return NSLocalizedString("Неверный пин код!",
                                     comment: "")
        case .noCashInBalance(needed: let needed):
            return NSLocalizedString("Недостаточно средств на вашем балансе! Необходимо: \(Double(needed).rounded(toPlaces: 2)) рублей",
                                     comment: "")
        case .noCashInBankomat(needed: let needed):
            return NSLocalizedString("Недостаточно средств в банкомате! Необходимо: \(Double(needed).rounded(toPlaces: 2)) рублей",
                                     comment: "")
        case .invalidCurrency:
            return NSLocalizedString("Неправильная валюта",
                                     comment: "")
        }
    }
}

// MARK: - Создание карты, банкомата и проверка
var myCard: Card = Card(name: "Артур", surname: "Сейфуллаев", pinCode: 1324, balance: 300.0.blr)

var atmBelinvestBank: Bankomat = Bankomat(card: myCard, enterPinCode: 1324)

do {
    try atmBelinvestBank.getMoney(summ: 350.0.rus, currency: "rus") { $0 - $1 }
} catch {
    print(error.localizedDescription)
}

