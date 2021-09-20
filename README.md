# development-guidelines

**WIP: this is a draft**

Code style: [pep8](https://www.python.org/dev/peps/pep-0008/)


## Development cicles
https://basecamp.com/shapeup
3 + 1 ???

## Repository branches
https://trunkbaseddevelopment.com

- tag releases
- develop features on new branches (feature branch)
- fix bugs on new branches


## Testing
Test Driven Development.
1. Before fixing a bug, write a test that reproduces the issue.
2. Before developing a new feature, write a test that describes the expected behaviour on  different conditions and states.
3. If some code cannot be tested, refactor it until it can.


## Code optimization
Recommended tools for optimizing python and specifically Django code:
- [django-debug-toolbar](https://django-debug-toolbar.readthedocs.io/) for use during development in combination with development server (`runserver`): allows debugging CPU time, SQL queries...
- [cProfile](https://docs.python.org/3/library/profile.html): to generate a set of statistics that describes how often and for how long various parts of the program executed.
- [snakeviz](https://jiffyclub.github.io/snakeviz/): browser based graphical viewer for the output of Python’s cProfile module.

### How to optimize code with cProfile + snakeviz
1. Profile target code to be optimized with *cProfile*:
```python -m cProfile -out original.prof run.py```

2. Analyze profiling result using *snakeviz* (if you are confortable with cli you could use standard library [pstats module](https://docs.python.org/3/library/profile.html#module-pstats)):
```snakeviz original.prof```

3. Perform refactor and optimization (rembeber de 80/20 rule and put focus on the code which takes the major part of time)

4. Run again *cProfile* to generate a new profile of the refactored code:
```python -m cProfile -out refactored.prof run.py```

5. Check profile and compare with previous one.

6. Iterate until you are confindent with the result.

