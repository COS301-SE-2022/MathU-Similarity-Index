with open('final.txt')as result:
        uniqlines = set(result.readlines())
        with open('final.txt', 'w') as rmdup:
            rmdup.writelines(set(uniqlines))