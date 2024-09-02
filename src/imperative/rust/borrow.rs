// https://play.rust-lang.org/?version=stable&mode=debug&edition=2021
fn main() {
    let s = String::from("hello");
    let len = length(s);
    println!("'{}' of size {}.", s, len); // Does not compile!
}

fn length(s: String) -> usize {
    s.len()
}

// But this works, because length does not take ownership but only borrows the value.
/* 
fn main() {
    let s = String::from("hello");
    let len = length(&s);
    println!("'{}' of size {}.", s, len);
}

fn length(s: &String) -> usize {
    s.len()
}
*/