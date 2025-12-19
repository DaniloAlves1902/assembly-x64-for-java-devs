public class SimpleCalculator {
    public static void main(String[] args) {
        int a = 10;
        int b = 5;

        showResult(sum(a, b));
        showResult(subtract(a, b));
        showResult(multiply(a, b));
        showResult(divide(a, b));

        b = 0;
        try {
            showResult(divide(a, b));
        } catch (ArithmeticException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }

    static int sum(int a, int b) {
        return a + b;
    }

    static int subtract(int a, int b) {
        return a - b;
    }

    static int multiply(int a, int b) {
        return a * b;
    }

    static int divide(int a, int b) {
        if (b == 0) {
            throw new ArithmeticException("Division by zero or invalid divisor.");
        }
        return a / b;
    }

    static void showResult(int result) {
        System.out.println("Result: " + result);
    }
}