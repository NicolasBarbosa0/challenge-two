//  main.swift
//  Challenge 2
//
//  Created by Nicolas Barbosa on 15/03/22.
//

import Foundation


//Class "user" stores the list of subjects added by the user
class User{
    let name: String?
    var subject: Array<Subject>?

    init(name: String, subject: Array<Subject>){
        self.name = name
        self.subject = subject
    }
}

// Class "Subject" stores the name of a subject it's topic and importance
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


class Hours{
    var available: Array<Double>
    var unavailable: Array<Double>
    
    init(available: Array<Double>, unavailable: Array<Double>){
        self.available = available
        self.unavailable = unavailable
    }
}


struct Application{
    
        //Prints the subjects, topics and importance
    func printRoutine(_ user: inout User) {
        for object in user.subject! {
            print("\n\(object.name ?? "Sem informação") : \(object.topic ?? "Sem informação") : \(object.importance )")
        }
    }
}




//Allows the user to delete the subjects
func deleteSub(_ array: Array<Subject>,_ subject: String?) -> Array<Subject>? {
    var varTemp: Array<Subject> = [ Subject(name: "erro", topic: "erro", importance: 0) ] //If the list is empty this will appear
    for info in array {
        if info.name == subject! {
            varTemp = array.filter({ object in object.name != subject! }) //Reads the list searching for a match based on the input given by the user
            
            break
        }
    }
    
    return varTemp
}


//User wants to change their routine
func alterRout(){
    
        print("\n1. Adicionar horários ocupados\n2. Adicionar horários livres\n3. Voltar a tela anterior")
    
    let newRoutine = readLine()
    
    switch newRoutine{
        case "1":
            
            print("Adicionou ocupado")
        
            break
        
        case "2":
        
            print("Adicionou livre")
        
            break
        
        case "3":
            
            app.printRoutine(&nic)
        
            break
    // Null answer
        case .none:
        
            print("Sem respota\n")
                
        default:
            
            print("Não entendi, por favor tente novamente")
            alterRout()
    }

}


let app = Application()
var nic = User(name: "Nicolas", subject: [])
               

//Poder adicionar (var) ou retirar matérias, tópicos

func alterSubjects(_ nic: inout User){
    
    app.printRoutine(&nic)
    
    while true {
    print("\n\n1. Adicionar matérias\n2. Remover matérias\n3. Editar matérias\n4. Alterar minha rotina\n")
    
    let newSubject = readLine()
   
        switch newSubject{

    // Yes
        case "1":

            var aux: Subject
            print("\nAdicione a matéria:")
            let nameAux = readLine()?.lowercased()
            
            print("\nAdicione o tópico:")
            let topicAux = readLine()?.lowercased()
            
            print("\nQual a importância dessa matéria (0 à 10):")
            
            let importanceAux = Int(readLine()!)
            
           
//            nic = User(name: "Nicolas", subject: [music, programing])
            aux = Subject(name: nameAux, topic: topicAux, importance: importanceAux!)
            
            //Limite
            if (aux.importance > 10){
                aux.importance = 10
            } else if (aux.importance < 0){
                aux.importance = 0
            }
            
            nic.subject!.append(aux)
            app.printRoutine(&nic)
        
            break
        
    // No
        case "2":
            
            print("digite a materia que quer remover: ")
            let option1 = readLine()?.lowercased()
            guard let info = deleteSub(nic.subject!, option1!)
            else {
                print("Valor não pode ser nulo")
                return
            }
            nic.subject = info
            app.printRoutine(&nic)
        
            break
         
        case "3":
            
            print("\nQue matéria você gostaria de alterar?")
            app.printRoutine(&nic)
            
            let option = readLine()!
            print(option)
            app.printRoutine(&nic)
            
            break
        
        case "4":
            
            alterRout()
            
            break
            
    // Null answer
        case .none:
                print("Sem respota\n")
            
        default:
            print("Não entendi, por favor tente novamente")
            app.printRoutine(&nic)
        }
    }
}
    alterSubjects(&nic)








//Poder adicionar e alterar (var) sua rotina


//Sugerir horário de estudo de uma hora (print e random) com 30 minutos de folga entre seu ultimo compromisso e proximo


//Persistência de Dados / Banco de Dados / API / readLine() <- print
