grades = {(1, "John", "Smith"): 90, (2, "Marry", "Jane"): 95, (3, "Sue", "Smith"): 85}

grades[(4, "Tim", "Doe")] = 100

for id, first, last in grades:
    print(first, last, grades[(id, first, last)])
