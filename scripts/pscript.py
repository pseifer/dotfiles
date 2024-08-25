"""
This is a utilities library for my scripts.

Notes:
    - must only depend on the standard library
    - may depend on the most recent Python 3 version available on Ubuntu
    - some functions marked private are intended for internal use by others
"""

import os
import re
import sys


def partition(predicate, iterable):
    """Partition iterable into two lists, using predicate.

    Returns:
    Tuple of two lists, (matching, not-matching).

    Example:
    >>> partition(lambda x: x % 2 == 0, range(1, 7))
    ([2, 4, 6], [1, 3, 5])
    """
    yes = []
    no = []
    add_yes = yes.append
    add_no = no.append
    for item in iterable:
        (add_yes if predicate(item) else add_no)(item)
    return yes, no


def literal_from_str(value: str, all_string=False, load_files=False):
    """Try to parse a literal value, or return as string if parsing fails.

    Arguments:
    value -- the str value to attempt parsing

    Keyword arguments:
    all_string -- simply convert anything to str (default: False)
    load_files -- if str is a valid path, then attempt to load
                  contents (default: False)

    Returns:
    Value corresponding to some Python literal, Path, JSON, or CSV.

    Example:
    >>> sl = literal_from_str("42", all_string=True)
    >>> type(sl) == str
    True

    >>> il = literal_from_str("42", all_string=False)
    >>> type(il) == int
    True
    """
    # Overwrites all settings: If all_string is set, just return as string.
    if all_string:
        return str(value)

    # If load_files is set, attempt to load with stdlib tools.
    # If the path exists, return loaded data for supported
    # file extensions, or the path itself.
    path = os.path.join(os.getcwd(), value)
    if load_files and os.path.exists(path):
        if path.endswith(".json"):
            import json
            with open(path, encoding='utf8') as f:
                return json.load(f)
        elif path.endswith(".csv"):
            import csv
            with open(path, encoding='utf8') as f:
                return csv.reader(f)
        elif path.endswith(".txt"):
            with open(path, encoding='utf8') as f:
                return [line.rstrip() for line in f]
        else:
            return path

    # Otherwise, try to parse a literal value.
    try:
        import ast
        return ast.literal_eval(value)
    # If this fails for whatever reason, return as str.
    except Exception:
        return str(value)


def cli(gb, all_string=False, load_files=True, gen_help=True):
    """Construct and run CLI application from globals(), passed in as 'gb'.

    This allows Python functions to be called from the command line.
    Positional arguments are passed in as-is, whereas keyword arguments
    can be passed using Python syntax, i.e. `kwarg=value`.
    Arguments are converted to Python literals, if possible (unless
    all_string is set to True).

    If the first argument is the name of a function in scope, this function
    is called with the remaining arguments. Otherwise, a function 'main' is
    called, if it exists, with all arguments.
    If neither can be called, the process terminates with a message.

    If the special argument "--help" is supplied, print the docstring
    of the selected function.

    If load_files is set, then checks if argument is an existing path and has
    a supported extension (".json", ".csv", or ".txt") -- if so, supplies
    a dictionary, csv reader or list of lines, respectievly, to the function.
    If the path exists but does not have one of the supported extensions,
    passes a path object instead of a string.

    Arguments:
    gb -- the scope to use, usually a call to globals()

    Keyword arguments:
    all_string -- pass all arguments as strings (default: False)
    load_files -- load supported files with standard library (default: True)
    gen_help   -- generate the special "--help" argument (default: True)
    """
    # Partition argv into keyword and normal arguments.
    kwargs_raw, posargs_raw = partition(lambda a: "=" in a, sys.argv[1:])

    # Process keyword arguments, generating a dictionary.
    kwargs = {
        # Split on '=' and infer type for value and set str() for key.
        re.sub('^--', '', str(k)): literal_from_str(v, all_string, load_files)
        for k, v in
        (kw.split('=') for kw in kwargs_raw)
    }

    # Get the top-level function to call, or 'main' as a default.
    # The function corresponds to the first (non-keyword) argument.
    if len(posargs_raw) > 0 and posargs_raw[0] in gb:
        function = posargs_raw[0]
        posargs_raw = posargs_raw[1:]
    elif "main" in gb:
        function = "main"
    else:
        print("No function to call.")
        sys.exit(0)

    # Fix the type of all positional arguments.
    posargs = [
        literal_from_str(o, all_string, load_files) for o in posargs_raw
    ]

    # If 'help' is used, print the functions docstring.
    if gen_help and ("--help" in posargs or "-h" in posargs):
        print(gb[function].__doc__)
        sys.exit(0)

    # Finally, call 'function' with positional and keyword arguments.
    try:
        gb[function](*posargs, **kwargs)
    except TypeError as e:
        # On TypeError (usually wrong number of arguments),
        # print both the docstring help and error message.
        print(gb[function].__doc__)
        print(e)


# Run all doctests.
if __name__ == "__main__":
    import doctest
    doctest.testmod()
