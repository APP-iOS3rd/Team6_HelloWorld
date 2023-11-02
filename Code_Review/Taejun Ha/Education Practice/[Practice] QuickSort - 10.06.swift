
// QuickSort 예제 0

func quickSort(_ array: [Int]) -> [Int] {
    if array.count <= 1 {
        return array
    }
    var arr = array
    let pivot = arr.count/2
    var left = [Int]()
    var right = [Int]()
    for i in 0..<arr.count {
        if i != pivot {
            if arr[i] <= arr[pivot] { left.append(arr[i])}
            else { right.append(arr[i])}
        }
    }
    
    return quickSort(left) + [arr[pivot]] + quickSort(right)
}

print( quickSort([6, 5, 1, 4, 7, 2, 3]) )

