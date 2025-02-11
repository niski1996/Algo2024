from itertools import chain

def diag_1_sym(strng):
    letterMatrix = getLetterMatrix(strng)
    outputMatrix = getEmptyLetterMatrix(strng)
    for rnum, row in enumerate(letterMatrix):
        for cnum, column in enumerate(row):
            outputMatrix[cnum][rnum]=letterMatrix[rnum][cnum]



def getLetterMatrix(strng):
    return [[letter for letter in row] for row in strng.split("\n")]

def getEmptyLetterMatrix(strng):
    return [["" for letter in row] for row in strng.split("\n")]



s = "abcd\nefgh\nijkl\nmnop"
sl = list(s)

print(len(sl))
print(diag_1_sym(s))