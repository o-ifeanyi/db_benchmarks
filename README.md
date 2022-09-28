# DB Benchmarks
This project was carried out to compare [**Hive**](https://pub.dev/packages/hive) to other database options ([**Sembast**](https://pub.dev/packages/sembast), [**Sqflite**](https://pub.dev/packages/sqflite), [**Isar**](https://pub.dev/packages/isar), [**Objectbox**](https://pub.dev/packages/objectbox)). You can read the full article [**Here**](https://blog.logrocket.com/comparing-hive-other-flutter-app-database-options).

## 🚀 iOS Benchmark Results

The following benchmark results were gotten while running the project in release mode on a physical iPhone 12 v 15.6 in other to get a good performance.

**Results (time in milliseconds) from 10 consecutive runs for 1000 write ✍️ operations**

| DB | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | Avg(ms) |
|----|-------|-------|-------|-------|-------|-------|-------|-------|-------|-------|---------|
| Isar | 68 | 73 | 68 | 68 | 71 | 69 | 73 | 69 | 68 | 70 | 69.7 |
| Hive | 86 | 85 | 97 | 93 | 91 | 87 | 83 | 90 | 91 | 100 | 90.5 |
| Sembast | 241 | 252 | 263 | 257 | 258 | 240 | 236 | 253 | 257 | 246 | 250.3 |
| Sqflite | 774 | 653 | 665 | 697 | 757 | 757 | 769 | 836 | 758 | 819 | 751.2 |
| Objectbox | 18686 | 18705 | 18806 | 18790 | 18767 | 18724 | 18763 | 18717 | 18739 | 18744 | 18744.1 |

**Results (time in milliseconds) from 10 consecutive runs for 1000 read 📖 operations**

| DB | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | Avg(ms) |
|----|-------|-------|-------|-------|-------|-------|-------|-------|-------|-------|---------|
| Hive | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0.0 |
| Sembast | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2.0 |
| Sqflite | 135 | 133 | 136 | 151 | 134 | 132 | 133 | 131 | 155 | 140 | 138.0 |
| Objectbox | 14  | 24 | 24 | 23  | 30 | 24 | 24  | 24 | 23 | 23  | 23.3  |
| Isar      | 103 | 99 | 98 | 116 | 99 | 98 | 111 | 98 | 98 | 108 | 102.8 |

**Results (time in milliseconds) from 10 consecutive runs for 1000 delete 🚮 operations**

| DB | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | Avg(ms) |
|----|-------|-------|-------|-------|-------|-------|-------|-------|-------|-------|---------|
| Isar | 41 | 32 | 33 | 34 | 36 | 32 | 34 | 33 | 36 | 36 | 34.7 |
| Hive | 73 | 86 | 73 | 78 | 92 | 76 | 80 | 64 | 65 | 71 | 75.8 |
| Sembast | 485 | 507 | 491   | 481   | 503 | 491 | 497 | 523 | 503 | 515 | 499.6 |
| Sqflite | 733 | 750 | 743 | 741 | 748 | 743 | 749 | 754 | 842 | 830 | 763.3 |
| Objectbox | 18771 | 18784 | 18684 | 18698 | 18761 | 18680 | 18738 | 18683 | 18744 | 18739 | 18782.2 |

![Image](ss/ios.jpg)

## 🚀 Optimised iOS Benchmark Results
Hive, Isar and Objectbox have more optimised ways to perform CRUD operations like writing, reading or deleting multiple items at once instead of individually. Below are the results using such methods for each option.

**Resultsd(time in milliseconds) from 10 consecutive runs for writing ✍️ 1000 users to the database**

| DB | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | Avg(ms) |
|----|-------|-------|-------|-------|-------|-------|-------|-------|-------|-------|---------|
| Isar | 6  | 3  | 6  | 5  | 7  | 5  | 5  | 5  | 5  | 6  | 5.3  |
| Hive | 14 | 16 | 12 | 15 | 15 | 17 | 15 | 15 | 14 | 13 | 14.6 |
| Objectbox | 20 | 19 | 23 | 18 | 19 | 23 | 20 | 20 | 19 | 20 | 20.1 |

**Results (time in milliseconds) from 10 consecutive runs for reading 📖 1000 users from the database**

| DB | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | Avg(ms) |
|----|-------|-------|-------|-------|-------|-------|-------|-------|-------|-------|---------|
| Hive | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0.0 |
| Objectbox | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0.0 |
| Isar | 1 | 0 | 1 | 1 | 0 | 1 | 1 | 1 | 1 | 1 | 0.8 |

**Results (time in milliseconds) from 10 consecutive runs for deleting 🚮 1000 users from the database**

| DB | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | Avg(ms) |
|----|-------|-------|-------|-------|-------|-------|-------|-------|-------|-------|---------|
| Hive | 1  | 1  | 1  | 2  | 1  | 1  | 1  | 1  | 2  | 2  | 1.3 |
| Isar | 1  | 3  | 1  | 2  | 1  | 1  | 1  | 1  | 2  | 4  | 1.7 |
| Objectbox | 19 | 19 | 21 | 19 | 19 | 20 | 18 | 19 | 19 | 18 | 19.1 |

![Image](ss/ios_opt.jpg)


## 🚀 Android Benchmark Results

The following benchmark results were gotten while running the project in release mode on a physical Samsung galaxy A31 running on android 11 in other to get a good performance.

**Results (time in milliseconds) from 10 consecutive runs for 1000 write ✍️ operations**

| DB | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | Avg(ms) |
|----|-------|-------|-------|-------|-------|-------|-------|-------|-------|-------|---------|
| Hive | 322 | 321 | 322 | 402 | 380 | 287 | 340 | 303 | 300 | 320 | 329.7 |
| Isar | 382 | 431 | 311 | 351 | 346 | 377 | 323 | 363 | 262 | 363 | 350.9 |
| Objectbox | 1614 | 1525 | 1608 | 1502 | 1473 | 1522 | 1583 | 1522 | 1619 | 1521 | 1548.9 |
| Sembast | 2666 | 2352 | 2600 | 2507 | 2416 | 2297 | 2712 | 2641 | 2399 | 2508 | 2509.8 |
| Sqflite | 3968 | 5281 | 4122 | 3448 | 3767 | 3641 | 4280 | 3609 | 3828 | 4026 | 3997.0 |



**Results (time in milliseconds) from 10 consecutive runs for 1000 read 📖 operations**

| DB | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | Avg(ms) |
|----|-------|-------|-------|-------|-------|-------|-------|-------|-------|-------|---------|
| Hive | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1.0 |
| Sembast | 17 | 17 | 16 | 16 | 18 | 17 | 16 | 17 | 15 | 15 | 16.4 |
| Objectbox | 18 | 22 | 19 | 17 | 21 | 18 | 20 | 20 | 17 | 10 | 19.2 |
| Isar | 1142 | 1497 | 1380 | 1162 | 1305 | 1200 | 1240 | 1194 | 1206 | 1349 | 1267.5 |
| Sqflite | 3148 | 3275 | 3209 | 2696 | 2691 | 2723 | 2731 | 2660 | 2680 | 2654 | 2846.7 |



**Results (time in milliseconds) from 10 consecutive runs for 1000 delete 🚮 operations**

| DB | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | Avg(ms) |
|----|-------|-------|-------|-------|-------|-------|-------|-------|-------|-------|---------|
| Isar | 358 | 380 | 322 | 347 | 354 | 375 | 341 | 321 | 318 | 353 | 346.9 |
| Hive | 763 | 873 | 860 | 721 | 879 | 801 | 848 | 819 | 868 | 772 | 820.4 |
| Objectbox | 1566 | 1740 | 1580 | 1574 | 1650 | 2167 | 1575 | 1546 | 1586 | 1572 | 1655.6 |
| Sqflite | 3896 | 4026 | 3946 | 3878 | 3610 | 3889 | 3558 | 4315 | 3554 | 3509 | 3818.1 |
| Sembast | 6349 | 6729 | 7375 | 6575 | 6585 | 6980 | 6321 | 6770 | 6256 | 6756 | 6689.0 |


![Image](ss/android.jpg)

## 🚀 Optimised Android Benchmark Results
Hive, Isar and Objectbox have more optimised ways to perform CRUD operations like writing, reading or deleting multiple items at once instead of individually. Below are the results using such methods for each option.

**Resultsd(time in milliseconds) from 10 consecutive runs for writing ✍️ 1000 users to the database**

| DB | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | Avg(ms) |
|----|-------|-------|-------|-------|-------|-------|-------|-------|-------|-------|---------|
| Objectbox | 4 | 6 | 6 | 10 | 5 | 4 | 5 | 5 | 5 | 5 | 5.5 |
| Isar | 9 | 10 | 9 | 9 | 8 | 7 | 7 | 9 | 7 | 8 | 8.3 |
| Hive | 14 | 20 | 18 | 14 | 13 | 16 | 15 | 14 | 16 | 13 | 15.3 |

**Results (time in milliseconds) from 10 consecutive runs for reading 📖 1000 users from the database**

| DB | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | Avg(ms) |
|----|-------|-------|-------|-------|-------|-------|-------|-------|-------|-------|---------|
| Hive | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0.0 |
| Objectbox | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1.0 |
| Isar | 6 | 7 | 3 | 5 | 6 | 4 | 6 | 4 | 3 | 4 | 4.8 |

**Results (time in milliseconds) from 10 consecutive runs for deleting 🚮 1000 users from the database**

| DB | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | t(ms) | Avg(ms) |
|----|-------|-------|-------|-------|-------|-------|-------|-------|-------|-------|---------|
| Objectbox | 3 | 2 | 2 | 2 | 3 | 3 | 2 | 2 | 3 | 3 | 2.5 |
| Hive | 5 | 6 | 7 | 5 | 5 | 7 | 5 | 6 | 6 | 4 | 5.6 |
| Isar | 8 | 8 | 5 | 4 | 4 | 5 | 5 | 8 | 9 | 3 | 5.9 |

![Image](ss/android_opt.jpg)

## 🤓 Author(s)
**Onuoha ifeanyi.** [![Twitter Follow](https://img.shields.io/twitter/follow/onuoha_ifeanyi.svg?style=social)](https://twitter.com/onuoha_ifeanyi)

## 🔖 LICENCE
    Copyright 2022 Onuoha Ifeanyi

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
