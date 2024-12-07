def functional_perfect_number(number):
    return number > 0 and sum(filter(lambda i: number % i == 0, range(1, number))) == number
