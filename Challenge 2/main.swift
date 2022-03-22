//  main.swift
//  Challenge 2
//
//  Created by Nicolas Barbosa on 15/03/22.
//

import Foundation

//Mostrar as matérias, tópicos e importancia de cada uma
// Class User
class User{
    let name: String?
    var subject: Array<Subject>

    init(name: String, subject: Array<Subject>){
        self.name = name
        self.subject = subject
    }
}
// Class subject
class Subject{
    var name: String?
    var topic: String?
    var importance: Int
    
    init(name: String?, topic: String?, importance: Int) {
        self.name = name
        self.topic = topic
        self.importance = importance
    }
}


//Rotina do usuário
//(0.0 - 24.0
var planner: [[Int]] = [
    [6,0],
    [7,0],
    [8,0],
    [9,0],
    [10,0],
    [11,0],
]


struct Application{
    
        //Prints the subjects, topics and importance
    func trySoHard(_ user: inout User) {
        for object in user.subject {
            print("\(object.name ?? "Sem informação") : \(object.topic ?? "Sem informação") : \(object.importance )\n")
        }
    }
}


var music = Subject(name: "Musica", topic: "Escalas", importance: 7)
var programing = Subject(name: "Programação", topic: "POO", importance: 9)
let app = Application()
var nic = User(name: "Nicolas", subject: [music, programing])
               

//Poder adicionar (var) ou retirar matérias, tópicos

func alterSubjects(_ nic: inout User){
    app.trySoHard(&nic)
    
    while true {
    print("\n1. Adicionar matérias\n2. Remover matérias\n3. Editar matérias\n4. Tarefa Concluida")
    
    let newSubject = readLine()
   
        switch newSubject{

    // Yes
        case "1":
//            var aux = Subject(name: "", topic: "", importance: 0)
            var aux: Subject
            print("\nAdicione a matéria:")
            let nameAux = readLine()
            
            print("\nAdicione o tópico:")
            let topicAux = readLine()
            
            print("\nQual a importância dessa matéria (0 à 10):")
            
            let importanceAux = Int(readLine()!)
            
            
//            nic = User(name: "Nicolas", subject: [music, programing])
            aux = Subject(name: nameAux, topic: topicAux, importance: importanceAux!)
            nic.subject.append(aux)
            app.trySoHard(&nic)
        
            break
        
    // No
        case "2":
            print("Rotina\n")
        break
         
    // Null answer
        case .none:
                print("Sem respota\n")
        default:
            print("default")
        }
    }
}
    alterSubjects(&nic)
// Invalid answer
//        case .some:
//            print("Resposta inválida\n")
//        return alterSubjects()
//    }
//    }
//    alterSubjects()

//Importancia varia de (limite, se) 0 (Matéria não aparece) a 10 (100% de chance de aparecer em um dia)


//Poder adicionar e alterar (var) sua rotina


//Sugerir horário de estudo de uma hora (print e random) com 30 minutos de folga entre seu ultimo compromisso e proximo


//Persistência de Dados / Banco de Dados / API / readLine() <- print
