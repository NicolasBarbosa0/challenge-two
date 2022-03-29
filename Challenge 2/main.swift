//  main.swift
//  Challenge 2
//
//  Created by Nicolas Barbosa on 15/03/22.
//
import Foundation


//Class "User" stores the list of subjects added by the user
class User {
    let name: String?
    var subject: Array<Subject>?
    var busy: Array<Hours>?
    var rest: Array<Hours>?
    
    init(name: String, subject: Array<Subject>, busy: Array<Hours>?, rest: Array<Hours>?){
        self.name = name
        self.subject = subject
        self.busy = busy
        self.rest = rest
    }
}

// Class "Subject" stores the name of a subject it's topic and importance
class Subject {
    var name: String?
    var topic: String?
    var importance: Int
    
    init(name: String?, topic: String?, importance: Int) {
        self.name = name
        self.topic = topic
        self.importance = importance
    }
}


// Class "Hours" stores available and unavailable time of the user
class Hours {
    var available: Array<Double>?
    var unavailable: Array<Double>?
    
    init(available: Array<Double>?, unavailable: Array<Double>?){
        self.available = available
        self.unavailable = unavailable
    }
}


//Prints the subjects, topics and importance
    func printRoutine(_ user: inout User) {
        print("\n\n------------------------------------")
        print("Horários:")
        
        for hours in user.busy! {
            print("\nOcupado: \(hours.unavailable ?? [00])")
        }
    
        for free in user.rest! {
            print("Disponivel: \(free.available ?? [00])\n")
        }
        
        print("------------------------------------")
        
        print("Matérias:")
        
        for object in user.subject! {
            print("\n\(object.name ?? "Sem informação") : \(object.topic ?? "Sem informação") : \(object.importance )")
        }
        
        print("------------------------------------")
    }




//Allows the user to delete the subjects
func deleteSub(_ array: Array<Subject>,_ subject: String?) -> Array<Subject>? {
    var varTemp: Array<Subject> = [ Subject(name: "erro", topic: "erro", importance: 0) ] //If the list is empty this will appear
    for info in array {
        if info.name == subject! {
            varTemp = array.filter({ object in object.name != subject! }) //Reads the list searching for a match based on the input given by the user
            // Caso o valor não seja encontrado a função está retornando apenas "erro" e substituindo as outras matérias
            break
        }
    }
    
    return varTemp
}


var nic = User(name: "Nicolas", subject: [], busy: [], rest: [])
               

//Poder adicionar (var) ou retirar matérias, tópicos
func alterSubjects(_ nic: inout User) {
    
    while true {
        
    printRoutine(&nic)
    
    print("\n\n1. Adicionar matérias\n2. Remover matérias\n3. Adicionar horários ocupados\n4. Adicionar horários livres")
    
    let newSubject = readLine()
   
        switch newSubject {

    // Add subjects
        case "1":

            var aux: Subject
            print("\nAdicione a matéria:")
            let nameAux = readLine()?.lowercased()
            
            print("\nAdicione o tópico:")
            let topicAux = readLine()?.lowercased()
            
            print("\nQual a importância dessa matéria (0 à 10):")
            
            let importanceAux = Int(readLine()!)
            
           
            aux = Subject(name: nameAux, topic: topicAux, importance: importanceAux!) //Tratar caso não consiga converter
            
            //Limite
            if (aux.importance > 10) {
                aux.importance = 10
            } else if (aux.importance < 0) {
                aux.importance = 0
            }
            
            nic.subject!.append(aux)
        
            break
        
    // Remove subjects
        case "2":
            
            print("Digite a materia que quer remover: ")
            let option1 = readLine()?.lowercased()
            guard let info = deleteSub(nic.subject!, option1!)
            else {
                print("Valor não pode ser nulo")
                return
            }
            nic.subject = info
        
            break
  
    //Alter routine
        case "3":
            
            //alterRout()
            var unaux: Hours
                
                print("Quando essa atividade começa?")
                let initialUnhour = Double(readLine()!)! // Tratar o caso do usuario entrar um texto invalido
            
                print("Quando essa atividade termina?") // Tratar o caso do usuario entrar um texto invalido
                let finalUnhour = Double(readLine()!)!
            
            var activity: Array<Double> = []
            
            var currentHour = initialUnhour
            
            while currentHour <= finalUnhour {
                activity.append(currentHour)
                currentHour += 0.5
            }
            
            unaux = Hours(available: [], unavailable: activity)
            
            nic.busy!.append(unaux)

            break
            
        case "4":
            
            var avaux: Hours
            
                print("Que horas você estará disponivel?") // Tratar o caso do usuario entrar um texto invalido
                let initialRest = Double(readLine()!)!
            
                print("Até que horas você ficará disponivel?") // Tratar o caso do usuario entrar um texto invalido
                let finalRest = Double(readLine()!)!
            
            var rest: Array<Double> = []
            
            var restHour = initialRest
            
            while restHour <= finalRest {
                rest.append(restHour)
                restHour += 0.5
            }
            
            avaux = Hours(available: rest, unavailable: [])
            nic.rest!.append(avaux)
            
            break
            
    // Null answer
        case .none:
                print("Sem respota\n")
            
        default:
            print("Não entendi, por favor tente novamente")
            printRoutine(&nic)
        }
    }
}
    alterSubjects(&nic)

