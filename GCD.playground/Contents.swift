import UIKit

// Queue - Main, Global, Custom

// - Main
DispatchQueue.main.async{
    // UI update
    let view = UIView()
    view.backgroundColor = UIColor.white
    
}
// - Global
DispatchQueue.global(qos: .userInteractive).async {
    // 당장 해야할 것
    
}

DispatchQueue.global(qos: .userInitiated).async {
    // 거의 바로 해야할 것, 사용자가 결과를 기다림
    
}

DispatchQueue.global(qos: .default).async { // qos 옵션 안 넣으면 디폴트다.
    // 굳이?
    
}

DispatchQueue.global(qos: .utility).async {
    // 시간이 좀 걸리는 일, 사용자가 당장 기다리지 않아도 되는 것
    // 네트워킹, 디스크에서 큰 파일 불러올 때?
    
}

DispatchQueue.global(qos: .background).async {
    // 사용자들한테 당장 인식될 필요가 없는 것들
    // 뉴스 데이터 미리 받기, 위치 업데이트, 영상 다운 받기
    
}

// - Custom Queue
// 사실 직접 만들어서 쓸 일은 별로 없다고...
let concurrentQueue = DispatchQueue(label: "concurrent", qos: .background, attributes: .concurrent)

let seriaQueue = DispatchQueue(label: "serial", qos: .background)



// 복합적인 상황
func downloadImageFromServer() -> UIImage{
    // Heavy Task
    
    
    return UIImage()
}

func updateUI(_ Image: UIImage){
    
}

DispatchQueue.global(qos: .background).async {
    let image = downloadImageFromServer()
    DispatchQueue.main.async {
        // update UI
        // UI 업데이트 작업을 main에서 수행하지 않을 시 오류가 나기도 한다.
        // 위와 같은 상황을 대비하기 위해 UI 작업은 main에서 이루어지도록 코드를 작성하는 습관을 가져야 한다.
        updateUI(image)
    }
    
}

// Sync & Async


// Async
DispatchQueue.global(qos: .background).async {
    for i in 0...5{
        print("😈 \(i)")
    }
}
DispatchQueue.global(qos: .userInteractive).async {
    for i in 0...5{
        print("😀 \(i)")
    }
}


// Sync

DispatchQueue.global(qos: .background).sync {
    for i in 0...5{
        print("😈 \(i)")
    }
}
DispatchQueue.global(qos: .userInteractive).async {
    for i in 0...5{
        print("😀 \(i)")
    }
}

