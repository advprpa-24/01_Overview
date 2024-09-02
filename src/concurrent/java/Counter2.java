package concurrent.java;

public class Counter2 {
    private volatile int cnt;
    public void inc() { cnt++; }
    public int getCnt() { return cnt; }

    public static void main(String[] args) throws InterruptedException {
        int cnt = 0;
        do {
            var c = new Counter();
            var t1 = new Thread(() -> { for(int i = 0; i < 10; i++) c.inc(); });
            var t2 = new Thread(() -> { for(int i = 0; i < 10; i++) c.inc(); });
            t1.start(); t2.start();
            t1.join(); t2.join();
            cnt = c.getCnt();
        } while(cnt == 20);
        System.out.println("DONE: " + cnt);
    }
}

