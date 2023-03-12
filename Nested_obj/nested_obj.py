# Python function 
def solution(obj, key):
    keys = key.split('/') #Split function to converting string into list by separating them using "/"
    output = obj
    for i in keys: #For loop to navigate through the nested object drilling down to the final object
        output = output[i]
    return output
    
obj = {'a':{'b':{'c':'d'}}}
key = 'a/b/c'
solution = solution(obj, key) #Calling function
print(solution)
    