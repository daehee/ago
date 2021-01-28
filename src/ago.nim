import strformat, times, math

const
  hourMinutes = 60
  dayMinutes = hourMinutes * 24
  monthMinutes = dayMinutes * 30
  yearMinutes = dayMinutes * 365

proc pluralize(i: int64, s: string): string =
  result = &"{i} {s}"
  if i != 1: result.add "s"

proc ago*(fromTime: DateTime): string =
  ## Reports the approximate distance in time until now
  let dur = now() - fromTime

  let durInMin = dur.inMinutes
  if durInMin <= 2:
    let durInSec = dur.inSeconds
    if durInSec < 30: return "less than a minute ago"
    if durInSec < 90: return "1 minute ago"
  elif durInMin < 45: return durInMin.pluralize("minute") & " ago"
  # 45 minutes up to 24 hours
  elif durInMin < dayMinutes: return "about " & ceil(durInMin.int / 60).int.pluralize("hour") & " ago"
  # 24 hours up to 42 hours
  elif durInMin <= (42 * hourMinutes): return "1 day ago"
  # 42 hours up to 30 days
  elif durInMin <= (30 * dayMinutes): return ceil(dur.inHours.int / 24).int.pluralize("day") & " ago"
  elif durInMin <= (45 * dayMinutes): return "about 1 month ago"
  # 30 days up to 60 days
  elif durInMin <= (60 * dayMinutes): return "about 2 months ago"
  # 60 days up to 365 days
  elif durInMin < yearMinutes: return floor(dur.inDays.int / 30).int.pluralize("month") & " ago"
  # years
  else:
    let rem = floorMod(durInMin, yearMinutes)
    var durInYr = floor(durInMin.int / yearMinutes).int

    if rem < (3 * monthMinutes): return "about " & durInYr.pluralize("year") & " ago"
    elif rem < (9 * monthMinutes): return "over " & durInYr.pluralize("year") & " ago"
    else:
      durInYr.inc
      return "almost " & durInYr.pluralize("year") & " ago"
