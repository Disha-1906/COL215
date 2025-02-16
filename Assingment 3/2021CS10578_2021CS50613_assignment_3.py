def opt_function_reduce(func_TRUE, func_DC):
    #Simplification of two strings s1 and s2
    def str_num(s1,s2):
        s = ''
        for i in range(0,len(s1)):
            if s1[i]==s2[i]:
                s+='0'
            else:
                s+='1'
        return s 
    #Transforming Complements
    def dic(dd):
        dt={'a':'A','b':'B','c':'C','d':'D','e':'E','f':'F','g':'G','h':'H','i':'I','j':'J','k':'K','l':'L','m':'M','n':'N','o':'O','p':'P','q':'Q','r':'R','s':'S','t':'T','u':'U','v':'V','w':'W','x':'X','y':'Y','z':'Z'}
        p = ''
        i = 0
        while i<len(dd):
            if i==len(dd)-1:
                p +=dd[i]
                i = i+1
            else:
                if dd[i+1]=="'":
                    p+=dt[dd[i]]
                    i = i+2
                else:
                    p+=dd[i]
                    i = i+1
        return p
    #Converting string into binary
    def bny(e):
        q = ''
        for i in range(0,len(e)):
            if e[i]=='*':
                q+='9'
            elif e[i].islower():
                q+='1'
            elif e[i].isupper():
                q+='0'
        return q
    # Checking string s1 in s2:
    def check(s1,s2):
        for i in s1:
            if i not in s2:
                return False
        return True
    # Checking lists
    def list_check(l1,l2):
        l3=[]
        for i in range(0,len(l1)):
            if l1[i] in l2:
                l3.append(l1[i])
        return l3
    # Converting to complements
    def final_str(sp):
        tt={'A':'a','B':'b','C':'c','D':'d','E':'e','F':'f','G':'g','H':'h','I':'i','J':'j','K':'k','L':'l','M':'m','N':'n','O':'o','P':'p','Q':'q','R':'r','S':'s','T':'t','U':'u','V':'v','W':'w','X':'x','Y':'y','Z':'z'}
        jk=''
        for zz in range(0,len(sp)):
            if sp[zz].islower():
                jk+=sp[zz]
            else:
                jk+=tt[sp[zz]] + "'"
        return jk
        
    def comb_function(func_True,func_DC):
        comb = func_True + func_DC
        bny_comb = []
        for i in range(0,len(comb)):
            comb[i]=dic(comb[i])
            bny_comb.append(bny(comb[i]))
        
        new_in =[]
        sec = []
        for j in range(0,len(func_True)):
            new_in_copy = new_in[:]
            for k in range(j+1,len(bny_comb)):
                x = str(str_num(bny_comb[j],bny_comb[k]))
                if x.count('1')==1:
                    new_in.append(str(comb[j]).replace(comb[j][x.index('1')],'*'))
                    sec += [comb[j],comb[k]]
                    
            if new_in == new_in_copy and sec.count(comb[j])==0:
                new_in.append(comb[j])

        list_a = []
        list_y = []
        list_x = []
        def recur_sol(f):
            list_x.append(f)
            ff = f
            for j in range(0,len(f)):
                list_a_copy = list_a[:]
                if '*' not in f[j]:
                    list_a.append(f[j])
                else:
                    for k in range(j+1,len(f)):
                        if len(f[j])==len(f[k]):
                            if '*' in f[k]:
                                if str(f[j]).index('*')==str(f[k]).index('*'):
                                    value = str(str_num(bny(f[j]),bny(f[k])))
                                    if value.count('1')==1:
                                        list_y.append(f[j])
                                        list_y.append(f[k])
                                        list_a.append(str(f[j]).replace(f[j][value.index('1')],'*'))
                    if list_y.count(f[j])==0 and list_a == list_a_copy  and list_a.count(f[j])==0:
                        list_a.append(f[j])
            if list_a == ff:
                return list_a
            return recur_sol(list_a)
        new_out = recur_sol(new_in)
        def execution(new_out):
            list_out = []
            def min_str(s1,s2):
                r = True
                for v in range(0,len(s2)):
                    if s2[v] not in s1:
                        r= False
                        break
                return r

            for r in range(0,len(new_out)):
                w = ''
                for h in range(0,len(new_out[r])):
                    if new_out[r][h]!='*':
                        w+=new_out[r][h]
                list_out.append(w)

            
            list_k=[]
            for z in range(0,len(func_True)):
                list_u = []
                for e in range(0,len(list_out)):
                    if min_str(dic(func_True[z]),list_out[e]) == True:
                        list_u.append(list_out[e])
                mm=0
                for hh in range(0,len(list_u)):
                    if len(list_u[hh])<len(list_u[mm]):
                        mm=hh
                list_k.append(list_u[mm])
            list_k = list(set(list_k))
            ONE=[]
            for h1 in range(0,len(list_k)):
                one=[]
                for h2 in range(0,len(func_TRUE)):
                    if check(list_k[h1],dic(func_TRUE[h2])) == True:
                        one.append(dic(func_TRUE[h2]))
                ONE.append(one)
            dump=[]
            output=[]
            for h3 in range(0,len(ONE)):
                l4=[]
                for h4 in range(0,len(ONE)):
                    if h3!=h4:
                        if ONE[h4] not in dump:
                            l4 += list_check(ONE[h3],ONE[h4])
                l4 = list(set(l4))
                if set(l4) == set(ONE[h3]):
                    dump.append(ONE[h3])
                else:
                    output.append(final_str(list_k[h3]))
            # print(dump)
            # ff=ONE.index(dump[0])
            # print(list_k[ff])
            # new_k=[]
            # for h8 in range(0,len(list_k)):
            #     new_k.append(final_str(list_k[h8]))
            # for h9 in range(0,len(output)):
            #     new_k.remove(output[h9])
            # print('Deleted regions------->',new_k)
            # all_del=[]
            # print('Deleted Terms--------------->')
            # for h10 in range(0,len(new_k)):
            #     del_terms=[]
            #     del_terms+=(ONE[list_k.index(dic(new_k[h10]))])
            #     for b in range(0,len(del_terms)):
            #         del_terms[b]=final_str(del_terms[b])
            #     print(new_k[h10],'----------->',del_terms)
            #     all_del+=del_terms
            # print('Covering region -------------->')
            # for h11 in range(0,len(all_del)):
            #     for h12 in range(0,len(output)):
            #         if(check(dic(output[h12]),dic(all_del[h11]))):
            #             print(all_del[h11],'------------->',output[h12])
            if output ==['']:
                return None
            return output
        return execution(new_out)
    return comb_function(func_TRUE,func_DC)
# print(opt_function_reduce(["a'b'c'd'e'", "a'b'cd'e", "a'b'cde'", "a'bc'd'e'","a'bc'd'e", "a'bc'de", "a'bc'de'", "ab'c'd'e'", "ab'cd'e'"],["abc'd'e'", "abc'd'e", "abc'de", "abc'de'"]))
# print(opt_function_reduce(["a'bc'd'", "abc'd'", "a'b'c'd", "a'bc'd", "a'b'cd"],["abc'd"]))
# print(opt_function_reduce(["a'b'c'd", "a'b'cd", "a'bc'd", "abc'd'", "abc'd", "ab'c'd'", "ab'cd"],["a'bc'd'", "a'bcd", "ab'c'd"]))
# print(opt_function_reduce(["a'b'c'd'e'", "a'bc'd'e'", "abc'd'e'", "ab'c'd'e'", "abc'de'", "abcde'","a'bcde'", "a'bcd'e'", "abcd'e'", "a'bc'de", "abc'de", "abcde","a'bcde", "a'bcd'e", "abcd'e", "a'b'cd'e", "ab'cd'e"],[]))
# print(opt_function_reduce(["a'b'", "a'b", "ab'", "ab"], []))
# print(opt_function_reduce["a'b'c", "a'bc", "a'bc'", "ab'c'"],["a'c", "a'b", "ac'"])
# print(opt_function_reduce(["a'b'c'd'e'", "a'bc'd'e'", "abc'd'e'", "ab'c'd'e'", "abc'de'", "abcde'",
# "a'bcde'", "a'bcd'e'", "abcd'e'", "a'bc'de", "abc'de", "abcde",
# "a'bcde", "a'bcd'e", "abcd'e", "a'b'cd'e", "ab'cd'e"],[]))
# print(opt_function_reduce(["a'b'c", "a'bc", "a'bc'", "ab'c'"], ["abc'"]))
# print(opt_function_reduce(["a'bc'd'", "abc'd'", "a'b'c'd", "a'bc'd", "a'b'cd"], ["abc'd"]))
# print(opt_function_reduce(["a'b'c'd", "a'b'cd", "a'bc'd", "abc'd'", "abc'd", "ab'c'd'", "ab'cd"],["a'bc'd'", "a'bcd", "ab'c'd"]))
# print(opt_function_reduce(["a'b'c'd'e'", "a'bc'd'e'", "abc'd'e'", "ab'c'd'e'", "abc'de'", "abcde'", "a'bcde'", "a'bcd'e'", "abcd'e'","a'bc'de", "abc'de", "abcde", "a'bcde", "a'bcd'e", "abcd'e", "a'b'cd'e", "ab'cd'e"], []))
# print(opt_function_reduce(['abcde', "ab'c'de", "ab'cde"], ["ab'c'de'"]))
# print(opt_function_reduce(["a'b'c'", "a'b'c", "a'bc'", "a'bc"], ["ab'c'", "abc'", "ab'c", "abc"]))
# print(opt_function_reduce(["a'b'c'd'e'", "a'b'cd'e", "a'b'cde'", "a'bc'd'e'", "a'bc'd'e", "a'bc'de", "a'bc'de'", "ab'c'd'e'", "ab'cd'e'"],["abc'd'e'", "abc'd'e", "abc'de", "abc'de'"]))
# print(opt_function_reduce(["a'bc'defgh", "a'bc'd'efgh", "abc'd'efgh", "abc'defgh", "a'bc'def'gh", "a'bc'd'ef'gh", "abc'd'ef'gh","abc'def'gh"], []))
# print(opt_function_reduce(["a'b", "a'b'"], []))
# print(opt_function_reduce(["a'b'c'd'e'", "a'b'cd'e", "a'b'cde'", "a'bc'd'e'", "a'bc'd'e", "a'bc'de", "a'bc'de'", "ab'c'd'e'", "ab'cd'e'"],["abc'd'e'", "abc'd'e", "abc'de", "abc'de'"]))
# # ------------------------------------------TEST CASES FOR 2 VARIABLES-----------------------------------------------------
# print(opt_function_reduce(["a'b'"], []))
# print(opt_function_reduce(["a'b'"], ["a'b"]))
# print(opt_function_reduce(["a'b'", "ab'"], ["a'b"]))
# # ALL ARE ONE
# print(opt_function_reduce(["a'b'", "a'b", "ab'", "ab"], []))
# # -----------------------------------------TEST CASES FOR 3 VARIABLES-----------------------------------------------------------
# print(opt_function_reduce(["a'b'c'", "a'b'c", "a'bc", "a'bc'"], ["ab'c'", "ab'c"]))
# print(opt_function_reduce(["a'b'c'", "a'b'c"], ["ab'c'", "ab'c"]))
# print(opt_function_reduce(["a'b'c'd'e'", "a'b'cd'e", "a'b'cde'", "a'bc'd'e'", "a'bc'd'e", "a'bc'de", "a'bc'de'", "ab'c'd'e'", "ab'cd'e'"],["abc'd'e'", "abc'd'e", "abc'de", "abc'de'"]))
# print(opt_function_reduce(["a'b'c'd'e'f'", "a'b'c'd'e'f", "a'b'cd'e'f'", "a'b'cd'e'f", "a'bc'd'e'f'", "a'bcd'e'f'", "ab'c'd'ef", "abc'de'f'","abc'de'f", "abc'def'", "abc'def"], ["abcde'f'", "abcde'f", "abcdef'", "abcdef"]))
# print(opt_function_reduce(["a'b'c'd'e'f'", "a'b'c'd'e'f", "a'b'cd'e'f'", "a'b'cd'e'f", "a'b'cd'ef'", "a'b'cd'ef", "a'b'cde'f'", "a'b'cde'f","a'b'cdef'", "a'b'cdef", "a'bc'd'e'f'", "a'bcd'e'f'", "ab'c'd'ef", "abc'de'f'", "abc'de'f", "abc'def'", "abc'def"],["abcde'f'", "abcde'f", "abcdef'", "abcdef"]))
# print(opt_function_reduce(['abcd', "ab'c'd", "ab'cd"], ["abcd'"]))
# print(opt_function_reduce(["a'bc'de", "a'bcde"], ["a'b'cde", "a'b'cde'"]))
# print(opt_function_reduce(["a'bcdef", "a'b'c'def", "a'b'c'd'e'f'", "a'b'c'd'ef", "a'b'c'd'e'f", "a'b'cdef"],["ab'cd'ef", 'abcdef', "ab'cdef", "ab'cd'e'f"]))
# print(opt_function_reduce(['abcde', "ab'c'de", "ab'cde"], ["ab'c'de'"]))
# <---------aastha----------------->
# print(opt_function_reduce(["a'b'c", "a'bc", "a'bc'", "ab'c'"], ["abc'"]))
# print(opt_function_reduce(["a'bc'd'", "abc'd'", "a'b'c'd", "a'bc'd", "a'b'cd"], ["abc'd"]))
# print(opt_function_reduce(["a'b'c'd", "a'b'cd", "a'bc'd", "abc'd'", "abc'd", "ab'c'd'", "ab'cd"],["a'bc'd'", "a'bcd", "ab'c'd"]))
# print(opt_function_reduce(["a'b'c'd'e'", "a'bc'd'e'", "abc'd'e'", "ab'c'd'e'", "abc'de'", "abcde'", "a'bcde'", "a'bcd'e'", "abcd'e'","a'bc'de", "abc'de", "abcde", "a'bcde", "a'bcd'e", "abcd'e", "a'b'cd'e", "ab'cd'e"], []))
# print(opt_function_reduce(['abcde', "ab'c'de", "ab'cde"], ["ab'c'de'"]))
# print(opt_function_reduce(["a'b'c'", "a'b'c", "a'bc'", "a'bc"], ["ab'c'", "abc'", "ab'c", "abc"]))
# print(opt_function_reduce(["a'b'c'd'e'", "a'b'cd'e", "a'b'cde'", "a'bc'd'e'", "a'bc'd'e", "a'bc'de", "a'bc'de'", "ab'c'd'e'", "ab'cd'e'"],["abc'd'e'", "abc'd'e", "abc'de", "abc'de'"]))
# print(opt_function_reduce(["a'bc'defgh", "a'bc'd'efgh", "abc'd'efgh", "abc'defgh", "a'bc'def'gh", "a'bc'd'ef'gh", "abc'd'ef'gh","abc'def'gh"], []))
# print(opt_function_reduce(["a'b", "a'b'"], []))
# print(opt_function_reduce( ["a'b'c'd'e'", "a'b'cd'e", "a'b'cde'", "a'bc'd'e'", "a'bc'd'e", "a'bc'de", "a'bc'de'", "ab'c'd'e'", "ab'cd'e'"],["abc'd'e'", "abc'd'e", "abc'de", "abc'de'"]))
# # ------------------------------------------TEST CASES FOR 2 VARIABLES-----------------------------------------------------
# print(opt_function_reduce(["a'b'"], []))
# print(opt_function_reduce(["a'b'"], ["a'b"]))
# print(opt_function_reduce(["a'b'", "ab'"], ["a'b"]))
# # ALL ARE ONE
# print(opt_function_reduce(["a'b'", "a'b", "ab'", "ab"], []))
# -----------------------------------------TEST CASES FOR 3 VARIABLES-----------------------------------------------------------
# print(opt_function_reduce(["a'b'c'", "a'b'c", "a'bc", "a'bc'"], ["ab'c'", "ab'c"]))
# print(opt_function_reduce(["a'b'c'", "a'b'c"], ["ab'c'", "ab'c"]))
# print(opt_function_reduce(["a'b'c'd'e'", "a'b'cd'e", "a'b'cde'", "a'bc'd'e'", "a'bc'd'e", "a'bc'de", "a'bc'de'", "ab'c'd'e'", "ab'cd'e'"],["abc'd'e'", "abc'd'e", "abc'de", "abc'de'"]))
# print(opt_function_reduce(["a'b'c'd'e'f'", "a'b'c'd'e'f", "a'b'cd'e'f'", "a'b'cd'e'f", "a'bc'd'e'f'", "a'bcd'e'f'", "ab'c'd'ef", "abc'de'f'","abc'de'f", "abc'def'", "abc'def"], ["abcde'f'", "abcde'f", "abcdef'", "abcdef"]))
# print(opt_function_reduce(["a'b'c'd'e'f'", "a'b'c'd'e'f", "a'b'cd'e'f'", "a'b'cd'e'f", "a'b'cd'ef'", "a'b'cd'ef", "a'b'cde'f'", "a'b'cde'f","a'b'cdef'", "a'b'cdef", "a'bc'd'e'f'", "a'bcd'e'f'", "ab'c'd'ef", "abc'de'f'", "abc'de'f", "abc'def'", "abc'def"],["abcde'f'", "abcde'f", "abcdef'", "abcdef"]))
# print(opt_function_reduce(['abcd', "ab'c'd", "ab'cd"], ["abcd'"]))
# print(opt_function_reduce(["a'bc'de", "a'bcde"], ["a'b'cde", "a'b'cde'"]))
# print(opt_function_reduce(["a'bcdef", "a'b'c'def", "a'b'c'd'e'f'", "a'b'c'd'ef", "a'b'c'd'e'f", "a'b'cdef"],["ab'cd'ef", 'abcdef', "ab'cdef", "ab'cd'e'f"]))
# print(opt_function_reduce(['abcde', "ab'c'de", "ab'cde"], ["ab'c'de'"]))
# print(opt_function_reduce(["a'b'c'd'e'", "a'bc'd'e'", "abc'd'e'", "ab'c'd'e'", "abc'de'", "abcde'","a'bcde'", "a'bcd'e'", "abcd'e'", "a'bc'de", "abc'de", "abcde","a'bcde", "a'bcd'e", "abcd'e", "a'b'cd'e", "ab'cd'e"],[]))