import 'dart:io';

void main() {
  performTasks();
}

void performTasks() {
  task1();
  task2();
  task3();
}

void task1() {
  print('Task 1 done');
}

void task2() {
  Duration d = Duration(seconds: 3);
  sleep(d);
  print('Task 2 done');
}

void task3() {
  print('Task 3 done');
}