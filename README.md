# csuthesis
Provide csuthesis.cls and corresponding example for writing CSU's thesis. This template provides two `printstyle`: `print` for submisstion offline, `electron` for submission online.

## 1. How to compile it with TeX live 2020?

​    (1) First, if your manuscript contains some code listed by `minted` package, you should install `pygments` package in your Python environment as follows.

```bash
pip install pygments
```

And check using the following code:

```bash
pygmentize -L styles
```

​    (2) Then, just run the following command in your command-line to build `document.pdf` and `bookcover.pdf`.

```bash
make all
```

​    (3) In addition, you would like to clean the log file like `*.aux`, `*.log` , etc, so you can do like that:

```bash
make clean
make clean-pdf
```

## 2. Suggestions

   * To use this template, you should have  basic knowledge with TeX system. Herein, I recommend you to take the video lessons in BiliBili:
     1. [刘海洋老师教程] https://www.bilibili.com/video/BV1s7411U7Pr
     2. [LaTeX中文排版] https://www.bilibili.com/video/BV1Sb411s7cq
   * This template was only tested in Linux and MS OS with TeX live 2020. So if any question, please don't hesitate to contact with me *xuwei3893@csu.edu.cn*.

# Note：

One should run "make bookcover.pdf" before running "make document.pdf".

