import SwiftUI

struct ContentView: View {
    
    @State var openFile = false
    @State var imgageLoad = UIImage()

    @State var fileName = ""

    
    var body: some View {
        NavigationView{
            VStack{
                Button(action: {
                    self.openFile.toggle()
                }){
                    Text("Open File Picker")
                } .fileImporter(isPresented: $openFile, allowedContentTypes: [.image]) { (res) in
                    do{
                        let fileUrl = try res.get()
                        self.fileName = fileUrl.lastPathComponent
                        fileUrl.startAccessingSecurityScopedResource()
                        if let imageData = try? Data(contentsOf: fileUrl),
                        let image = UIImage(data: imageData) {
                            self.imgageLoad = image
                        }

                        fileUrl.stopAccessingSecurityScopedResource()
                        
                    } catch{
                        print ("error reading")
                        print (error.localizedDescription)
                    }
                    
                }
                
                Image(uiImage: self.imgageLoad)
                    .renderingMode(.original)
                    .resizable()
                
            }.navigationTitle("File Importer")
                .navigationBarTitleDisplayMode(.inline)
        }
       
        
    }
}

