class Base {
};

class Derived : public Base {
};

int main() {
  Derived d;

  Derived d2 = d;

  d2 = d;

  Base& b = d;
}
