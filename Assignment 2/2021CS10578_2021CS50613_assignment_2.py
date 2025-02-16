def comb_function_expansion(func_TRUE, func_DC):
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
                        
            def final_str(sp):
                tt={'A':'a','B':'b','C':'c','D':'d','E':'e','F':'f','G':'g','H':'h','I':'i','J':'j','K':'k','L':'l','M':'m','N':'n','O':'o','P':'p','Q':'q','R':'r','S':'s','T':'t','U':'u','V':'v','W':'w','X':'x','Y':'y','Z':'z'}
                jk=''
                for zz in range(0,len(sp)):
                    if sp[zz].islower():
                        jk+=sp[zz]
                    else:
                        jk+=tt[sp[zz]] + "'"
                return jk
            final_ans = []
            for pq in range(0,len(list_k)):
                final_ans.append(final_str(list_k[pq]))
            if final_ans.count('')==len(final_ans):
                final_ans=[None for i in range(len(final_ans))]
            return final_ans
        def demo(list_x):
            Dem=[]
            for n in range(0,len(list_x)):
                Dem.append(execution(list_x[n]))
            return Dem 
        print(demo(list_x))
        return execution(new_out)
    return comb_function(func_TRUE,func_DC)
 



