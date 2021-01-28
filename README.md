# ago

A "time ago in words" helper for Nim, ported from Rails `time_ago_in_words`.

## Usage

```nim
block:
  let fromTime = now() - 45.minutes
  echo fromTime.ago # "about 1 hour ago"

block:
  let fromTime = now() - (31.days)
  echo fromTime.ago # "about 1 month ago"

block:
  let fromTime = now() - (2.years + 3.months)
  echo fromTime.ago # "over 2 years ago"
```
