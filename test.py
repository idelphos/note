


for cock in range(0,20):
    for hen in range(0,33):
        chicken = 100 - cock - hen
        if cock * 5 + hen * 3 + chicken/3 == 100:
            print(f'the amount of cock is {cock}, the amount of hen is {hen}, the amount of chicken is {chicken}')
