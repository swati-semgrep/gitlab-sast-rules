#!/usr/bin/env python3
# License: MIT (c) GitLab Inc.

import logging

def good():
    while True:
        try:
            v = 1
        except TypeError as k:
            logging.info("Info level logging")
        except Exception:
            logging.info("Info level logging")

def bad_basic(cond):
    while cond:
        try:
            v = 1
        except ValueError: continue
    
def bad_in_group():
    condition = 10 > 0
    while condition:
        try:
            v = 1
        except EOFError:
            logging.info("Info level logging")
        except ValueError: continue
        except KeyError as e:
            continue
        except TypeError as k:
            logging.info("Info level logging") 
    
def bad_with_finally():
    while True:
        try:
            v = 1
        except ValueError: continue
        finally:
            logging.info("blah")
        
def bad_nested():
    keep_going = 1 > 0
    while keep_going:
        try:
            v = 0
            try:
                res = 1/v
            except ZeroDivisionError:
                continue
        except Exception as e:
            logging.error("blah", e)


