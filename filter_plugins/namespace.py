#!/usr/bin/python

class FilterModule(object):
    def filters(self):
        return {
            'ns_join_by': self.join_by
        }


    def join_by(self, mylist=[], group_by=3, D=',', d=';'):
        list_grouped_by_comma=[]
        if len(mylist) % group_by == 0:
            for i in range(len(mylist) / group_by):
                list_grouped_by_comma.append(D.join(map(str, mylist[(i * group_by):(i * group_by + group_by)])))

        return d.join(map(str, list_grouped_by_comma))
