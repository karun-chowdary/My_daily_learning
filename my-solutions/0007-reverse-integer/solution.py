class Solution:
    def reverse(self, x: int) -> int:
        sign = -1 if x<0 else 1
        re = int(str(abs(x))[::-1])*sign
        return re if -(2**31)<=re<=(2**31-1) else 0
