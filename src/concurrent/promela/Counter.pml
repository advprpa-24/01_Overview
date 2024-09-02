int cnt = 0;
#define N 10

active [2] proctype Thread() {
  int i; 
  do
  :: (i < N) ->
     int reg = cnt;
     cnt = reg + 1;
     i = i + 1;
     
  :: else -> 
     break;
  od 
}

ltl minCntValue {
  <>([](cnt >= 3))
}

// cd src/concurrent/promela
// Create analyzer source code:
// ./spin_osx -a Counter.pml
// Compile analyzer to executable:
// cc -o pan pan.c
// Run analyzer (creates a trace file)
// ./pan -a -n
// Analyze trace file:
// ./spin_osx -t -p -g  Counter.pml | egrep 'cnt =|proc'
