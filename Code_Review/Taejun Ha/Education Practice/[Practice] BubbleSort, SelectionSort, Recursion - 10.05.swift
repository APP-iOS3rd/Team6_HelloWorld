
// 버블 정렬 예제 1
//
//func bubbleSort(_ array: [Int]) -> [Int] {
//    var sortingArray = array
//    
//    for i in 0..<sortingArray.count - 1 {
//        var max = 0
//        for j in 0..<sortingArray.count - i - 1 {
//            if sortingArray[j] > sortingArray[j+1] {
//                (sortingArray[j], sortingArray[j+1]) = (sortingArray[j+1], sortingArray[j])
//            }
//        }
//    }
//    return sortingArray
//}
//
//let numberArray = readLine()!.split(separator: " ").map{Int($0)!}
//print(bubbleSort(numberArray))



// 선택 정렬 예제 1
//
//func selectionSort(_ arr: [Int]) -> [Int] {
//    var array = arr
//
//    for i in 0..<array.count {
//        var index = i
//        for j in i+1..<array.count {
//            if array[index] > array[j] {
//                index = j
//            }
//        }
//        array.swapAt(i, index)
//    }
//
//    return array
//}
//
//print(selectionSort([5,2,1,3,4,7]))



// 선택 정렬 예제 2
//
//struct MusicAlbum {
//    let name: String
//    let singer: String
//    let streams: Int
//}
//
//func streamingRanking(_ albums: Array<MusicAlbum>) -> Array<MusicAlbum> {
//    var array = albums
//
//    for i in 0..<array.count {
//        var index = i
//        for j in i+1..<array.count {
//            if array[index].streams > array[j].streams {
//                index = j
//            }
//        }
//        array.swapAt(i, index)
//    }
//
//    return array.reversed()
//}
//
//var musicAlbums = Array<MusicAlbum>()
//
//musicAlbums.append(MusicAlbum(name: "롤린 (Rollin')", singer: "브레이브걸스", streams: 156))
//musicAlbums.append(MusicAlbum(name: "Celebrity", singer: "아이유", streams: 141))
//musicAlbums.append(MusicAlbum(name: "On The Ground", singer: "로제 (ROSÉ)", streams: 35))
//musicAlbums.append(MusicAlbum(name: "LOVE DAY (2021)", singer: "양요섭, 정은지", streams: 94))
//musicAlbums.append(MusicAlbum(name: "밤하늘의 별을(2020)", singer: "경서", streams: 88))
//musicAlbums.append(MusicAlbum(name: "Gone", singer: "로제 (ROSÉ)", streams: 61))
//musicAlbums.append(MusicAlbum(name: "Dynamite", singer: "방탄소년단", streams: 111))
//
//streamingRanking(musicAlbums).enumerated().forEach{ (rank, album) in
//    print("[\(rank + 1)위]\n\(album.name)\n\(album.singer)\n")
//}




// 재귀함수 예제 0
//
//func factorial(_ num: Int) -> Int {
//    if num == 0 {
//        return 1
//    }
//    return num * factorial(num-1)
//}
//
//print(factorial(5))



// 재귀함수 예제 1
//
//func count(_ array: [Int]) -> Int {
//    if array.isEmpty {
//        return 0
//    }
//    return 1 + count(array.dropLast())
//}
//
//print(count([1,2,3,4,5]))




// 재귀함수 예제 2
//
//func max(_ array: [Int]) -> Int {
//    if array.count == 1{
//        return array[0]
//    }
//
//    let center = array.count/2
//
//    if array.count == 2{
//        return array[0] > array[1] ? array[0] : array[1]
//    }
//
//    let left = max(Array(array[0..<center]))
//    let right = max(Array(array[center..<array.count]))
//    return left > right ? left : right
//}
//
//print(max([1,2,6,9,10,3,4]))




// 재귀함수 예제 3 - 1,2
// 3-1
//func fibonacci(_ num: Int) -> Int {
//    var count = num/2
//    var first = 0
//    var second = 1
//
//    for _ in 1...count {
//        first = first + second
//        second = first + second
//    }
//
//    return num%2 == 0 ? first : second
//}
//
// 3-2
//func fibonacciRecursion(_ num: Int) -> Int {
//    if num <= 1 {
//        return num
//    }
//    return fibonacciRecursion(num-1) + fibonacciRecursion(num-2)
//}
//
//print("함수 :", fibonacci(10))
//print("재귀 :", fibonacciRecursion(10))



// 재귀함수 예제 4
//
//func divideSquare(x: Int, y: Int) -> Int {
//    var divide = 2
//
//    while true {
//        if x%divide == 0 && y%divide == 0 {
//            break
//        } else if x%divide != 0 || y%divide != 0 {
//            divide += 1
//        }
//        if divide > x || divide > y {
//            divide = 1
//            return divide
//        }
//    }
//    
//    return divide * divideSquare(x: x/divide, y: y/divide)
//}
//
//print(divideSquare(x: 640, y: 1680))
