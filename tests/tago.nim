import unittest
import times

import ago

suite "ago":
  test "time deltas":
    block:
      let fromTime = now() - 29.seconds
      check fromTime.ago == "less than a minute ago"

    block:
      let fromTime = now() - 45.minutes
      check fromTime.ago == "about 1 hour ago"

    block:
      let fromTime = now() - (1.hours + 15.minutes)
      check fromTime.ago == "about 2 hours ago"

    block:
      let fromTime = now() - (1.days)
      check fromTime.ago == "1 day ago"

    block:
      let fromTime = now() - (2.days + 12.hours)
      check fromTime.ago == "3 days ago"

    block:
      let fromTime = now() - (30.days)
      check fromTime.ago == "30 days ago"

    block:
      let fromTime = now() - (31.days)
      check fromTime.ago == "about 1 month ago"

    block:
      let fromTime = now() - (3.months + 12.hours)
      check fromTime.ago == "3 months ago"

    block:
      let fromTime = now() - (401.days)
      check fromTime.ago == "about 1 year ago"

    block:
      let fromTime = now() - (2.years + 2.months)
      check fromTime.ago == "about 2 years ago"

    block:
      let fromTime = now() - (2.years + 3.months)
      check fromTime.ago == "over 2 years ago"

    block:
      let fromTime = now() - (2.years + 11.months)
      check fromTime.ago == "almost 3 years ago"
