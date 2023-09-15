Решение задачи "Regular Expression Matching" с помощью динамического программирования

## Условие задачи

Даны две строки `s` и `p`. Реализуйте функцию `isMatch`, которая определяет, соответствует ли строка `s` шаблону `p`. Шаблон `p` может содержать символы `"."` и `"*"`.

* `"."` соответствует любому одиночному символу.
* `"*"` соответствует нулю или более повторениям предыдущего символа.

Строки могут содержать только строчные буквы латинского алфавита (a-z).

## Примеры

### Пример 1

Входные данные: `s = "aa"`, `p = "a"`

Выходные данные: `false`

Объяснение: "a" не может соответствовать целиком строке "aa".

### Пример 2

Входные данные: `s = "aa"`, `p = "a*"`

Выходные данные: `true`

Объяснение: `*` символ соответствует предыдущему символу `a`, который повторяется 0 раз. Таким образом, "a" соответствует строке "aa".

### Пример 3

Входные данные: `s = "ab"`, `p = ".*"`

Выходные данные: `true`

Объяснение: `.` символ соответствует любому одиночному символу, `*` символ соответствует 0 или более повторениям предыдущего символа. Таким образом,`.` соответствует букве `"a"`, которая появляется один раз, затем `*` символ соответствует предыдущей букве `"a"`, которая повторяется один раз. Следовательно, `"."` и `"a"` оба соответствуют `"a"`, затем `"b"` могут соответствовать любому одиночному символу.

### Пример 4

Входные данные: `s = "aab"`, `p = "c*a*b"`

Выходные данные: `true`

Объяснение: `*` символ соответствует нулю или нескольким дубликатам предыдущего символа `c`. В данном случае это действие не имеет эффекта, благодаря тому, что `c` отсутствует в строке, буква `a` соответствует букве `a`, которая появляется два раза, затем `*` символ соответствует букве `"a"`, которая повторяется один раз. Затем буква `"b"` должна соответствовать букве `"b"`, которая появляется один раз.

## Решение

Для решения использован алгоритм динамического программирования.

Создаётся двумерный массив `dp`, где `dp[i][j]` говорит о том, верно ли, что шаблон `p[j:]` соответствует подстроке `s[i:]`. 

Инициализация:

* `dp[m][n]` - верно, когда `s[m:]` и `p[n:]` пусты.
* `dp[i][n]` должно быть `true`, если `s[i:]` и `p[n:]` пусты. Это правда только тогда, когда `i=m` и `n=n`.

Рекурсивный случай:

* Если `p[j+1] == '*'`, то мы либо проигнорируем символ `p[j]`, либо удалите некоторые символы из `s`, чтобы обеспечить соответствие `p[j:]`  `s[i+1:]`. 
    * `dp[i][j] = dp[i][j+2] or first_match and dp[i+1][j]`.
* В противном случае мы должны просто сопоставить символ `p[j]` соответствующему символу `s[i]` и убедиться, что оставшаяся часть строк также соответствует. 
    * `dp[i][j] = first_match and dp[i+1][j+1]`.

В конце вернуть `dp[0][0]`.

### Реализация

Ниже приведены реализации данного алгоритма на C++, Java, C#, JavaScript, TypeScript, PHP, Dart, Go, Ruby, Rust и Erlang.

Выбери язык программирования, на котором ты хочешь увидеть исходный код:

- [C++](./is_match.cpp)
- [Java](./IsMatch.java)
- [C#](./IsMatch.cs)
- [JavaScript](./isMatch.js)
- [TypeScript](./isMatch.ts)
- [PHP](./is_match.php)
- [Dart](./is_match.dart)
- [Go](./is_match.go)
- [Ruby](./is_match.rb)
- [Rust](./is_match.rs)
- [Erlang](./is_match.erl)

## Тестирование

Примеры тестов на языке Python:

```python
assert not isMatch("aa", "a")
assert isMatch("aa", "a*")
assert isMatch("ab", ".*")
assert isMatch("aab", "c*a*b")
```

## Заключение

Мы познакомились с задачей "Regular Expression Matching" и её решением с помощью алгоритма динамического программирования. Данное решение может быть использовано для анализа подобных задач, связанных со строками и шаблонами.
