class Solution:
    def kidsWithCandies(self, candies: List[int], extraCandies: int) -> List[bool]:
        max_value = max(candies)
        results = []
        for i in candies:
            if i + extraCandies >= max_value:
                results.append(True)
            else:
                results.append(False)
        return results
