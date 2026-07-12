#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
#include <concepts>
#include <ranges>

#define MAX_COUNT 100
#define SQUARE(x) ((x) * (x))

#if defined(__cplusplus)
constexpr int cpp_version = __cplusplus;  // 202002L for C++20
#endif

// Enum
enum class Color : int { Red = 1, Green = 2, Blue = 4 };

// Concept (C++20)
template<typename T>
concept Numeric = std::is_arithmetic_v<T>;

// Class with attributes, templates, member initializer list
template<Numeric T = double>
class [[nodiscard]] Point {
public:
    Point(T x = 0, T y = 0) : x_{x}, y_{y} {}

    [[nodiscard]] T x() const { return x_; }
    [[nodiscard]] T y() const { return y_; }

    auto operator+(const Point& other) const {
        return Point{x_ + other.x_, y_ + other.y_};
    }

private:
    T x_;
    T y_;
};

// Free function with trailing return type and structured bindings
auto divide(double a, double b) -> std::pair<bool, double> {
    if (b == 0.0) return {false, 0.0};
    return {true, a / b};
}

// Namespace
namespace utils {
    template<std::ranges::range R>
    constexpr auto sum(R&& range) {
        using T = std::ranges::range_value_t<R>;
        T total{};
        for (auto&& v : range) total += v;
        return total;
    }
}  // namespace utils

int main() {
    // Primitive types
    int          i    = 42;
    unsigned     u    = 0xFFu;        // hex
    long         l    = 0b1010'1010L;  // binary, digit separator
    float        f    = 3.14159f;
    double       d    = 2.718281828;
    char         c    = 'A';
    bool         b    = true;
    auto         a    = "auto deduced";
    const char*  s1   = "string literal with \"escapes\" and \\backslash";
    std::string  s2   = R"(raw string with ) and " inside)";

    // Containers and algorithms
    std::vector<int> nums = {1, 2, 3, 4, 5};
    std::ranges::sort(nums);

    // Structured bindings
    auto [ok, result] = divide(10.0, 3.0);

    // Lambda with capture
    auto square = [n = 0](int x) mutable {
        n += 1;
        return SQUARE(x);
    };

    // Range-based for
    for (const auto& n : nums) {
        std::cout << n << " ";
    }
    std::cout << "\n";

    // Point and Color
    Point p{1.0, 2.0};
    Color col = Color::Green;

    // Ternary, comparisons, logical operators
    std::cout << (ok ? "ok" : "fail") << "\n";
    std::cout << (i == 42 && b || !b) << "\n";

    // TODO: add more tests
    // FIXME: this is a marker comment
    return 0;
}
