def find_all(sum_dig, digs):
    allResult = [ ]
    for number in range(1,9):
        result = tmp([number], sum_dig, digs)
        if result is list:
            allResult.append("".join(result))
    return allResult


def tmp(ListOfNumbers, sum_dig, digs):
    for trial in range(ListOfNumbers[-1], 9):
        ListOfNumbers.append(trial)
        if sum_dig < sum(ListOfNumbers):
            return
        elif len(ListOfNumbers) > digs:
            return
        elif len(ListOfNumbers)==digs and sum_dig == sum(ListOfNumbers):
            return ListOfNumbers
        else:
            return tmp(ListOfNumbers, sum_dig, digs)


print(find_all(10, 3))
