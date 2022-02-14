//
//  main.swift
//  Practice Bin
//
//  Created by 손원빈 on 2022/02/02.
//

import Foundation

class Person {
    var money: Int
    var name: String
    init(money: Int, name: String) {
        self.money = money
        self.name = name
    }
}

class CoffeeShop {
    var sales: Int
    var pickUpTable: [Int] = []
    var coffeeMenu: Set<Coffee>
    var barista: Person
    
    init(sales: Int, coffeeMenu: Set<Coffee>, barista: Person) {
        self.sales = sales
        self.coffeeMenu = coffeeMenu
        self.barista = barista
    }
    
    func order(coffe: Coffee, customer: Person) {
        if customer.money < coffe.rawValue {
            print("잔액이 {\(coffe.rawValue - customer.money)}원 부족합니다.")
        } else {
            self.makeCoffee(customer: customer)
        }
        customer.money -= coffe.rawValue
        self.sales += coffe.rawValue
    }
    
    func makeCoffee(customer: Person) {
        self.pickUpTable.append(Int.random(in: 1...3))
        print("\(customer.name) 님의 커피가 준비되었습니다. \(self.pickUpTable) 픽업테이블에서 가져가주세요 ")
        
    }
   
    
}
enum Coffee: Int{
    case whiteChocolateMocha = 200
    case caffeLatte = 100
    case coldBrew = 300
}

var misterLee = Person(money: 3000, name: "미스터리")
var missKim = Person(money: 0, name: "미스김")
var onebin = Person(money: 0, name: "원빈")
var onebinBucks = CoffeeShop(sales: 0, coffeeMenu: [.whiteChocolateMocha, .coldBrew, .caffeLatte], barista: onebin)
onebinBucks.order(coffe: Coffee.whiteChocolateMocha, customer: misterLee)
onebinBucks.order(coffe: Coffee.caffeLatte, customer: missKim)
