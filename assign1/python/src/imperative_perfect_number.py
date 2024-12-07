def imperative_perfect_number(number):
    total = 0 

    for i in range(1, number):
        if number % i == 0:
            total += i

    return number > 1 and total == number
