#!/usr/bin/env python
# License: MIT (c) GitLab Inc.

import logging

def good():
    try:
        v = 1
    except TypeError as k:
        logging.info("Info level logging")
    except Exception:
        logging.info("Info level logging")

def bad_basic():
    try:
        v = 1
    except ValueError: pass
    
def bad_in_group():
    try:
        v = 1
    except EOFError:
        logging.info("Info level logging")
    except ValueError: pass
    except KeyError as e:
        pass
    except TypeError as k:
        logging.info("Info level logging") 
    
def bad_with_finally():
    try:
        v = 1
    except ValueError: pass
    finally:
        logging.info("blah")
        
def bad_nested():
    try:
        v = 0
        try:
            res = 1/v
        except ZeroDivisionError:
            pass
    except Exception as e:
        logging.error("blah", e)



