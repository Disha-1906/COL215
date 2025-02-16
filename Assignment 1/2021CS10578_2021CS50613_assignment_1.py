def is_legal_region(kmap_function,term):
    y=[]
    for mm in range(0,len(kmap_function)):
        y+=kmap_function[mm]
    if len(term)==2:
        x=set()
        x1=set()
        x2=set()
        if term[0]==0 or term[0]==None:
           l =[(0,0),(1,0)]
           x.update(l)
        if term[0]==1 or term[0]==None:
           l =[(1,1),(0,1)]
           x.update(l)
        if term[1]==0 or term[1]==None:
           s1 ={(0,0),(0,1)}
           x1.update(list(x.intersection(s1)))
        if term[1]==1 or term[1]==None:
           s2 ={(1,0),(1,1)}
           x2.update(list(x.intersection(s2)))
        x3 = x1.union(x2)
        h = list(x3)
        h.sort()
        for i in range(0,len(h)):
            q = (h[i][0]*2)+h[i][1]
            if y[q]==0:
                if len(h)==1:
                    return(h[0],h[0],False)                    
                return (h[0],h[-1],False)            
        if len(h)==1:
            return(h[0],h[0],True)
        return (h[0],h[-1],True)
    elif len(term)==3:
        x=set()
        x1=set()
        x2=set()
        x3=set()
        x4=set()
        if term[2]==0 or term[2]==None:
           l =[(0,0),(0,1),(0,2),(0,3)]
           x.update(l)
        if term[2]==1 or term[2]==None:
           l =[(1,0),(1,1),(1,2),(1,3)]
           x.update(l)
        if term[1]==0 or term[1]==None:
           s1 ={(0,0),(1,0),(0,3),(1,3)}
           x1.update(list(x.intersection(s1)))
        if term[1]==1 or term[1]==None:
           s2 ={(0,1),(0,2),(1,1),(1,2)}
           x2.update(list(x.intersection(s2)))
        if term[0]==0 or term[0]==None:
           s3 ={(0,0),(0,1),(1,0),(1,1)}
           x3.update(list(x.intersection(s3)))
        if term[0]==1 or term[0]==None:
           s4 ={(0,3),(0,2),(1,3),(1,2)}
           x4.update(list(x.intersection(s4)))
        x5 = x1.union(x2)
        x6 = x3.union(x4)
        x7 = x5.intersection(x6)
        h = list(x7)
        h.sort()
        for i in range(0,len(h)):
            q = (h[i][0]*4)+h[i][1]
            if y[q]==0:
                if len(h)==1:
                    return (h[0],h[0],False)
                elif h[0][1]+1!=h[1][1] and h[0][1]+3==h[-1][1]:
                    return (h[1],h[-2],False)
                return (h[0],h[-1],False)
        if len(h)==1:
            return(h[0],h[0],True)    
        elif h[0][1]+1!=h[1][1] and h[0][1]+3==h[-1][1]:
            return (h[1],h[-2],True)
        return (h[0],h[-1],True)
    elif len(term)==4:
        x=set()
        x1=set()
        x2=set()
        x3=set()
        x4=set()
        x5=set()
        x6=set()
        if term[2]==0 or term[2]==None:
           l =[(0,0),(0,1),(0,2),(0,3),(1,0),(1,1),(1,2),(1,3)]
           x.update(l)
        if term[2]==1 or term[2]==None:
           l =[(2,0),(2,1),(2,2),(2,3),(3,0),(3,1),(3,2),(3,3)]
           x.update(l)
        if term[1]==0 or term[1]==None:
           s1 ={(0,0),(1,0),(0,3),(1,3),(2,0),(2,3),(3,0),(3,3)}
           x1.update(list(x.intersection(s1)))
        if term[1]==1 or term[1]==None:
           s2 ={(0,1),(0,2),(1,1),(1,2),(2,1),(2,2),(3,1),(3,2)}
           x2.update(list(x.intersection(s2)))
        if term[0]==0 or term[0]==None:
           s3 ={(0,0),(0,1),(1,0),(1,1),(2,0),(2,1),(3,0),(3,1)}
           x3.update(list(x.intersection(s3)))
        if term[0]==1 or term[0]==None:
           s4 ={(0,3),(0,2),(1,3),(1,2),(2,2),(2,3),(3,2),(3,3)}
           x4.update(list(x.intersection(s4)))
        if term[3]==0 or term[3]==None:
           s5 ={(0,0),(0,1),(0,2),(0,3),(3,0),(3,1),(3,2),(3,3)}
           x5.update(list(x.intersection(s5)))
        if term[3]==1 or term[3]==None:
           s6 ={(1,0),(1,1),(1,2),(1,3),(2,0),(2,1),(2,2),(2,3)}
           x6.update(list(x.intersection(s6)))
        x7 = x1.union(x2)
        x8 = x3.union(x4)
        x9 = x5.union(x6)
        x10 = x7.intersection(x8)
        x11 = x10.intersection(x9)
        h = list(x11)
        g1 = list(x11)
        h.sort()
        g1.sort()
        g1.sort(key = lambda a: a[1]) 
        for i in range(0,len(h)):
            q = (h[i][0]*4)+h[i][1]
            if y[q]==0:
                if len(h)==1:
                    return(h[0],h[0],False)
                elif h == [(0,0),(0,3),(3,0),(3,3)]:
                    return((3,3),(0,0),False)
                elif h[0][1]+1!=h[1][1] and h[0][1]+3==h[-1][1]:
                    m1 = min([m[0] for m in h])
                    m2 = max([m[0] for m in h])
                    return ((m1,3),(m2,0),False)
                elif g1[0][0]+1!=g1[1][0] and g1[0][0]+3==g1[-1][0]:
                    m1 = min([m[1] for m in g1])
                    m2 = max([m[1] for m in g1])   
                    return ((3,m1),(0,m2),False)
                return (h[0],h[-1],False)
            else:
                continue
        if len(h)==1:
            return(h[0],h[0],True)            
        elif h == [(0,0),(0,3),(3,0),(3,3)]:
            return((3,3),(0,0),True)
        elif h[0][1]+1!=h[1][1] and h[0][1]+3==h[-1][1]:
            m1 = min([m[0] for m in h])
            m2 = max([m[0] for m in h])
            return ((m1,3),(m2,0),True)
        elif g1[0][0]+1!=g1[1][0] and g1[0][0]+3==g1[-1][0]:
            m1 = min([m[1] for m in g1])
            m2 = max([m[1] for m in g1])   
            return ((3,m1),(0,m2),True)
        return (h[0],h[-1],True)

