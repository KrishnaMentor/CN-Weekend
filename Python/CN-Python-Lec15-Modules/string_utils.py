def reverse_string(_str):
    return _str[::-1]

def count_vowels(_str): # 'racecar'
    vowels = 'aeiouAEIOU'
    count = 0
    for char in _str:
        if char in vowels: # Using Membership Operators [Boolean Returns]
            count+=1
    return count