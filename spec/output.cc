class Base
{
  public: 
  // inline constexpr Base() noexcept = default;
  // inline constexpr Base(const Base &) noexcept = default;
  // inline constexpr Base & operator=(const Base &) noexcept = default;
};


class Derived : public Base
{
  public: 
  // inline constexpr Derived() noexcept = default;
  // inline constexpr Derived(const Derived &) noexcept = default;
  // inline constexpr Derived & operator=(const Derived &) noexcept = default;
};


int main()
{
  Derived d;
  Derived d2 = Derived(d);
  d2.operator=(d);
  Base & b = static_cast<Base&>(d);
  return 0;
}
