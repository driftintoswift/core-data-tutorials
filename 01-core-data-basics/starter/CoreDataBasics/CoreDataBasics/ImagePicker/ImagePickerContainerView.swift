import SwiftUI

/*
    Container that holds image which when tapped shows image picker
 */
struct ImagePickerContainerView<Content: View>: View {
    
    @Binding var image: UIImage?
    @State private var isShowingImagePicker = false
    
    let content: Content
    
    init(
        image: Binding<UIImage?>,
        @ViewBuilder content: () -> Content
    ) {
        self._image = image
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            content
            if image == nil {
                Text("Tap to select image")
                    .font(.largeTitle)
            }
        }
            .onTapGesture {
                isShowingImagePicker.toggle()
            }
            .sheet(
                isPresented: $isShowingImagePicker,
                content: {
                    ImagePicker(image: $image)
                })
    }
    
}
