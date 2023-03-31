import UIKit

class Usuario {
    
    let id: Int
    var nome: String
    var saldo: Float

    init(){
        self.id = 0
        self.nome = ""
        self.saldo = 0.0
    }
    init(id: Int, nome: String){
        self.id = id
        self.nome = nome
        self.saldo = 0.0
    }
    
    func depositar(valor: Float){
        self.saldo = (self.saldo + valor) * 100 / 100
        print("A operação foi realizada com sucesso")
    }
    
    func saque(valor: Float){
        if (valor <= self.saldo){
            self.saldo = self.saldo - valor
            print("A operação foi realizada como sucesso")
        }
        else{
            print("Não foi possível realizar a operação pois não há saldo suficiente")
        }
        
    }
    
    func transferir(valor: Float, use: Usuario){
        saque(valor: valor)
        use.saldo = use.saldo + valor
    }
      
    func MostraSaldo(){
        let Cent = String(format:"%.2f", self.saldo)
        print("Olá \(self.nome) o seu saldo é de R$\(Cent))")
        
    }
    
    func MostraUser (){
        print(
            "ID : \(self.id) | Nome : \(self.nome) | Saldo : \(formatter.string(for: self.saldo)!) "
        )
    }
    
}

let formatter = NumberFormatter()
formatter.maximumFractionDigits = 2

func RegistraUser (Usuario : Usuario){
    Users.append(Usuario)
}

/*func DeletUser(user: Usuario){
    Users[user] =
}*/
var user1 = Usuario(id: 1, nome: "Diego")
var user2 = Usuario(id: 2, nome: "Matheus")
var user3 = Usuario(id: 3, nome: "Tullyo")

var Users = [user1]
RegistraUser(Usuario: user2)
RegistraUser(Usuario: user3)

user1.depositar(valor: 100.19)

user1.MostraSaldo()

user1.saque(valor: 50.50)

user2.depositar(valor: 200.10)

user2.MostraSaldo()

user2.transferir(valor: 200.09, use: user3)

user3.depositar(valor: 90.00)

user3.MostraSaldo()

for user in Users {
    user.MostraUser()
}

user1.transferir(valor: 50.00, use: user2)

for user in Users {
    user.MostraUser()
}
