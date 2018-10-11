
import Foundation

class StudentManager: NSObject {
    var students: [Student] = []
    
//    var dataURL: URL? {
//        let fm =
//    }
    
    let url = URL(fileURLWithPath: NSHomeDirectory())
        .appendingPathComponent("Documents")
        .appendingPathComponent("students.json")
    
    func writeTOFile() {
        //data.write(to: url)
        do {
            let studentsEncoded = try JSONEncoder().encode(students)
            
            
            try studentsEncoded.write(to: url)
        } catch {
            print("Error: \(error)")
        }
    }

    func fromReadFile() {
      //  Data(contentsOf: url)
        do {
            let data = try Data(contentsOf: url)
            let studentsDecoded = try JSONDecoder().decode([Student].self, from: data)
            students = studentsDecoded
        } catch {
            print("Error: \(error)")
        }

        
    
    }
}
