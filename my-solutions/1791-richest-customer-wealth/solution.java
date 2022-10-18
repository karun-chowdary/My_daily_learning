class Solution {
    public int maximumWealth(int[][] accounts) {
        int m = Integer.MIN_VALUE;
        for(int[] i:accounts){
            int n = sum(i);
            if(n>m) m=n;
        }
        return m;
    }
    int sum(int[] arr){
        int s =0;
        for(int i:arr){
            s+=i;
        }
        return s;
    }
}
