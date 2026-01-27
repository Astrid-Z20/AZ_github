class Solution:
    def mergeAlternately(self, word1: str, word2: str) -> str:
        res = []
        i = 0
        n1, n2 = len(word1), len(word2)
        for i in range(max(n1,n2)):
            if i < n1:
                res.append(word1[i])
            if i < n2:
                res.append(word2[i])
            i += 1
        return "".join(res) #join