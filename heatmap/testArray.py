import numpy as np
temp = np.array([[1, 2], [3, 4]])
print (temp[0][0])
print (temp[0][1])

def iround(x):
    """iround(number) -> integer
    Round a number to the nearest integer."""
    y = round(x) - .5
    return int(y) + (y > 0)

import decimal
x = decimal.Decimal("2.4999999999999999999999999")
whole, remain = divmod(x, 1)
if remain >= decimal.Decimal("0.5"):
    whole += 1
print(whole)


print ("lalalala = ", np.around([0.37, 1.64], decimals=1))
