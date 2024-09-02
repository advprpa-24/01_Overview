%hide Nat
%hide Z
%hide S
%hide Prelude.List.(++)

public export
data Nat 
  = Z 
  | S Nat

one : Nat
one = S Z

two : Nat
two = S (S Z)

public export
Num Nat where
  fromInteger 0 = Z
  fromInteger i = if i < 0 then Z else S (fromInteger (i-1))

  Z + n = n
  (S n) + m = S (n + m)
  -- (1+2) + 4 = 1 + (2+4)

  Z * n = Z
  (S n) * m = m + (n * m)
  -- (1+2) * 4 = 4 + (2 * 4)

public export
data Vect: (length:Nat) -> (elem:Type) -> Type where
  Nil : Vect Z a
  (::) : a -> Vect n a -> Vect (S n) a 

public export
(++) : Vect n a -> Vect m a -> Vect (n+m) a
Nil ++ ys = ys
(x::xs) ++ ys = x :: (xs ++ ys)

b : Vect 6 Int
b = [1,2,3] ++ [4,5,6]


-- Finite set and static index out of bounds checks.
public export
data Fin: (card:Nat) -> Type where
  FZ: Fin (S k) -- Zeroth element of finite set
  FS: Fin k -> Fin (S k)

i : Fin 3
i = FZ -- S {k=2}

j : Fin 3
j = FS FZ -- {k=1}

k : Fin 3
k = FS (FS FZ) -- {k=0}

--m : Fin 3
-- m = FS (FS (FS FZ))

public export
index : Fin n -> Vect n a -> a
index FZ (a :: as) = a
index (FS k) (_ :: as) = index k as


a : Vect 2 String
a = ["Hallo", "CompiletimeError"]

i0 : Fin 2
i0 = FZ

i1 : Fin 2
i1 = FS FZ -- 1 

i2 : Fin 3
i2 = FS (FS FZ) -- 2

-- i0 and i1 compiles, i2 gives compile time error 
example : String
example = index i0 a



