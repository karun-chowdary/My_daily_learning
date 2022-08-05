class Solution {
    public int[][] transpose(int[][] A ) {
      /*  for(int i =0;i<a.length;i++){
            for(int j =0;j<a[i].length;j++){
                if(j!=i){
                    int temp = a[i][j];
                    a[i][j]=a[j][i];
                    a[j][i]=temp;
                }
            }
        }
        return a; */

        int R = A.length, C = A[0].length;
        int[][] ans = new int[C][R];
        for (int r = 0; r < R; ++r)
            for (int c = 0; c < C; ++c) {
                ans[c][r] = A[r][c];
            }
        return ans;
    }
}
    
