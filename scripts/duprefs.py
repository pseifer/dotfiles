#!/usr/bin/env python3

import collections
import re
import sys


def main(bib_file):
    with open(bib_file) as file:
        lines = (matching for matching in file if re.search(r"@.*", matching))
        same_ids = False
        for line, count in collections.Counter(lines).items():
            if count > 1:
                if not same_ids:
                    print("References with the same ID:")
                same_ids = True
                print("  -", line)


if __name__ == "__main__":
    main(bib_file=sys.argv[1])
