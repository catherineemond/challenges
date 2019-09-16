input:
- log of strings to be parsed
- the format is: `[1518-09-28 00:56] wakes up|falls asleep|Guard #523 begins shift`
  - timestamp with format year-month-day hour:minute
  - 3 kinds of actions: begins shift, falls asleep, wakes up
- the log entries are unsorted

notes:
- there is *one* guard on duty for a given night
- all sleep/awake times are during the midnight hour, from `00:00` to `00:59`, only minutes are relevant
- the entries have to be sorted before they are analyzed

goals:
- strategy 1
  - find the guard that has the most minutes asleep
  - find the minute that the guard spend asleep the most
  - return the ID of the guard multiplied by the minute most slept

high-level approach:
- make guard objects that store: id, minutes asleep, total minutes sleeping
- maybe have a hash with guard id as key and info as value?
