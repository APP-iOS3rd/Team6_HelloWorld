import UIKit

//버블 정렬
//(배열을 복사해서 정렬할 새로운 배열을 만든다.)
//배열의 크기를 n이라고...
//n-1번 반복한다
//i번째부터 n-1번째까지의 원소들을 순회
//j번째 원소가 j+1번째 원소보다 크면 서로 교환
//정렬된 배열을 반환한다.
//func bubbleSort (_ array:[Int]) -> [Int] {
//    var sortedArray = array
//    var n = sortedArray.count
//    for _ in 0..<n - 1 {
//        for j in 0..<(n -  1)  {
//           
//            if sortedArray[j] > sortedArray[j + 1 ] {
//                //현재 J 번째가 j+1 보다 크면 새로운 변수에 넣기
//                var tmp = sortedArray[j]
//                //기존j 번째는 j+1  이 되는 숫자를 넣고
//                sortedArray[j] = sortedArray[j + 1]
//                //앞에 넣어둔 tmp 를 가져와서 그 다음 인덱스에 넣어줌
//                sortedArray[j + 1] = tmp
//                
//            }
//        }
//    }
//    return sortedArray
//}

//print( bubbleSort([5,3,6,2,1]) )


//선택정렬
//배열의 크기만큼 반복한다.
//현재 인덱스 다음부터 배열의 끝까지 반복하면서 최소값 인덱스를 찾는다.
//현재 값이 최소값보다 작으면 최소값 인덱스 갱신
//최소값 인덱스가 현재 인덱스와 다르면 두 값을 교환
//정렬된 배열을 반환
//func selectionSort(_ array:[Int]) ->[Int] {
//    var sortedArray = array
//    var cnt = sortedArray.count
//  
//    
//    for i in 0..<cnt {
//        var minNum = i
//        for j in i + 1..<cnt {
//            
//            if sortedArray[minNum] > sortedArray[j] {
//                minNum = j
//             
//                
//            }
//            print(i ,minNum, j)
//        }
//        if  i != minNum {
//            sortedArray.swapAt(i, minNum)
//        }
//       
//    }
//    
//    return sortedArray
//}
//
//print(selectionSort([5,3,6,2,1]))


//음악 순위 차트
//예제 1
//예제 2




