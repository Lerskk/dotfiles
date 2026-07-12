/* test.c - exercises C syntax highlight groups */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LEN 256
#define CONCAT(a, b) a##b

typedef struct {
    char *name;
    int age;
    float scores[3];
} Student;

typedef enum {
    STATUS_OK = 0,
    STATUS_ERR = -1,
    STATUS_TIMEOUT = -2
} Status;

// Global variable
static int global_count = 0;
const char *GREETING = "Hello, world!";

/* Multi-line
   comment */
// Single line comment

Student *create_student(const char *name, int age) {
    Student *s = malloc(sizeof(Student));
    if (s == NULL) {
        fprintf(stderr, "Allocation failed\n");
        return NULL;
    }
    s->name = strdup(name);
    s->age = age;
    for (int i = 0; i < 3; i++) {
        s->scores[i] = 0.0f;
    }
    global_count++;
    return s;
}

void print_student(const Student *s) {
    printf("Name: %s, Age: %d\n", s->name, s->age);
    printf("Scores: %.1f, %.1f, %.1f\n",
           s->scores[0], s->scores[1], s->scores[2]);
}

int compare_students(const Student *a, const Student *b) {
    if (a->age < b->age) return -1;
    if (a->age > b->age) return 1;
    return strcmp(a->name, b->name);
}

long factorial(long n) {
    if (n <= 1) return 1L;
    return n * factorial(n - 1);
}

int main(int argc, char *argv[]) {
    Student *students[3];
    students[0] = create_student("Alice", 20);
    students[1] = create_student("Bob", 22);
    students[2] = create_student("Charlie", 19);

    // Sort students
    for (int i = 0; i < 2; i++) {
        for (int j = i + 1; j < 3; j++) {
            if (compare_students(students[i], students[j]) > 0) {
                Student *tmp = students[i];
                students[i] = students[j];
                students[j] = tmp;
            }
        }
    }

    // Print all students
    for (int i = 0; i < 3; i++) {
        print_student(students[i]);
    }

    // Bitwise operations
    unsigned int flags = 0xFF;
    flags |= (1 << 3);
    flags &= ~(1 << 1);
    unsigned int shifted = flags >> 2;

    // Ternary and arithmetic
    int x = 42;
    int result = (x > 0) ? (x * 2 + 1) : (-x);

    // Char and escape sequences
    char newline = '\n';
    char tab = '\t';
    char null_char = '\0';

    // Long long, size_t, unsigned
    long long big = 9223372036854775807ULL;
    size_t len = strlen("test string");
    unsigned int hex_val = 0xDEADBEEF;
    float pi = 3.14159f;
    double e = 2.718281828459045;

    // Pointer arithmetic
    int arr[5] = {10, 20, 30, 40, 50};
    int *p = arr;
    int val = *(p + 2);

    // Switch statement
    Status st = STATUS_OK;
    switch (st) {
        case STATUS_OK:
            printf("OK\n");
            break;
        case STATUS_ERR:
            printf("Error\n");
            break;
        default:
            printf("Unknown\n");
            break;
    }

    // Do-while
    int i = 0;
    do {
        printf("%d ", i);
        i++;
    } while (i < 5);

    printf("\nResult: %d, Factorial: %ld\n", result, factorial(10));

    // Cleanup
    for (int i = 0; i < 3; i++) {
        free(students[i]->name);
        free(students[i]);
    }

    return 0;
}
