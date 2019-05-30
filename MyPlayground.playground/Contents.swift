import UIKit

//Permutation of String

func evaluateString(string: String){
    var charaterDictionary = Dictionary<Character,Int>()
    var characterArray = [Character]()
    var countArray = [Int]()
    for char in string{
        if charaterDictionary.keys.contains(char){
            charaterDictionary[char] = charaterDictionary[char]! + 1
        }
        else{
            charaterDictionary[char] = 1
        }
    }
    for (key,value) in charaterDictionary{
        characterArray.append(key)
        countArray.append(value)
    }
    let result = ""
    findPermutations(characterArray: characterArray, countArr: countArray, result: result, characterCount: string.count, level: 0)
}

func findPermutations(characterArray: [Character], countArr: [Int], result: String, characterCount: Int, level: Int){
    var mutableCountArray = countArr
    var mutableResult = result
    if level == characterCount{
        print(mutableResult)
        mutableResult = ""
        return
    }
    for i in 0..<countArr.count{
        if countArr[i] == 0{
            continue
        }
        mutableResult = result + String(characterArray[i])
        mutableCountArray[i] = mutableCountArray[i] - 1
        findPermutations(characterArray: characterArray, countArr: mutableCountArray, result: mutableResult, characterCount: characterCount, level: level + 1)
        mutableCountArray[i] = mutableCountArray[i] + 1
    }
}

let string = "ABCD"
evaluateString(string: string)
