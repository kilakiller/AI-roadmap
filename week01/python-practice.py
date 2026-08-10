r"""
Week 01 · Day 2 — Python 进阶 5 练习
日期：2026-08-09
目录：D:\ai\week01\
"""
import time
from contextlib import contextmanager
from dataclasses import dataclass
from typing import List, Optional


# ============================================================
# 练习 1：装饰器 — 实现一个计时装饰器
# ============================================================
def timer(func):
    """打印函数执行耗时"""
    def wrapper(*args, **kwargs):
        start = time.perf_counter()
        result = func(*args, **kwargs)
        elapsed = time.perf_counter() - start
        print(f"  [{func.__name__}] 耗时 {elapsed*1000:.2f} ms")
        return result
    return wrapper


# ============================================================
# 练习 2：生成器 — 斐波那契生成器（yield）
# ============================================================
def fibonacci(n: int):
    """生成前 n 个斐波那契数"""
    a, b = 0, 1
    for _ in range(n):
        yield a
        a, b = b, a + b


# ============================================================
# 练习 3：上下文管理器 — with 写文件 + 自动关闭
# ============================================================
@contextmanager
def write_file(path: str, mode: str = 'w'):
    """写入文件，用 with 自动关闭，异常时也保证关闭"""
    f = open(path, mode, encoding='utf-8')
    try:
        yield f
    finally:
        f.close()
        print(f"  [write_file] 已关闭 {path}")


# ============================================================
# 练习 4：typing — 给函数加类型注解
# ============================================================
def top_n(nums: List[float], n: int = 3, reverse: bool = False) -> List[float]:
    """返回列表前 n 大的元素"""
    return sorted(nums, reverse=reverse)[:n]


# ============================================================
# 练习 5：dataclass — 定义一个 User 数据类
# ============================================================
@dataclass
class User:
    name: str
    age: int
    email: Optional[str] = None
    skills: List[str] = None

    def __post_init__(self):
        if self.skills is None:
            self.skills = []

    def add_skill(self, skill: str) -> None:
        if skill not in self.skills:
            self.skills.append(skill)

    def introduce(self) -> str:
        return f"我是 {self.name}, {self.age} 岁, 技能: {', '.join(self.skills) or '暂无'}"


# ============================================================
# 跑一遍自测
# ============================================================
if __name__ == "__main__":
    print("=" * 60)
    print("练习 1：装饰器 — 计时")
    print("=" * 60)

    @timer
    def slow_func():
        time.sleep(0.1)
        return sum(range(1000))

    print(f"  结果: {slow_func()}\n")

    print("=" * 60)
    print("练习 2：生成器 — 斐波那契前 10 项")
    print("=" * 60)
    fibs = list(fibonacci(10))
    print(f"  结果: {fibs}\n")

    print("=" * 60)
    print("练习 3：上下文管理器 — 写文件")
    print("=" * 60)
    with write_file("D:/ai/week01/test_write.txt") as f:
        f.write("Hello from context manager!\n")
    with open("D:/ai/week01/test_write.txt", encoding='utf-8') as f:
        print(f"  写入内容: {f.read().strip()}\n")

    print("=" * 60)
    print("练习 4：typing — top_n")
    print("=" * 60)
    print(f"  [97, 23, 88, 14, 56, 3, 99, 41] 前 3 大: {top_n([97, 23, 88, 14, 56, 3, 99, 41], 3, reverse=True)}\n")

    print("=" * 60)
    print("练习 5：dataclass — User")
    print("=" * 60)
    me = User("kilakiller", 21, "1151862321@qq.com")
    me.add_skill("Python")
    me.add_skill("Git")
    me.add_skill("AI")
    print(f"  {me.introduce()}")
    print(f"  dataclass 字段: {[f.name for f in __import__('dataclasses').fields(me)]}")
