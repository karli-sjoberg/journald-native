# journald-native

A systemd-journal native logging lib wrapper

[See sd-journal help for more info](http://www.freedesktop.org/software/systemd/man/sd_journal_print.html)

## Usage

```ruby
    require 'journald/native'
```

## Constants

Constants are used to denote a log level

Available constants:

```ruby
    Journald::LOG_EMERG
    Journald::LOG_ALERT
    Journald::LOG_CRIT
    Journald::LOG_ERR
    Journald::LOG_WARNING
    Journald::LOG_NOTICE
    Journald::LOG_INFO
    Journald::LOG_DEBUG
```

systemd-journal uses syslog constants to denote level therefore they are equal to those of the Syslog module,
e.g. ```Journald::LOG_WARNING == Syslog::LOG_WARNING```. 
[See syslog man page for more info](http://man7.org/linux/man-pages/man3/syslog.3.html)

## Methods

Methods of Journald::Native class wrap systemd-journal calls. 
[See sd-journal help for more info](http://www.freedesktop.org/software/systemd/man/sd_journal_print.html) 

```ruby
    Journald::Native.send "MESSAGE=message", "PRIORITY=#{Journald::LOG_WARNING}"
    Journald::Native.print Journald::LOG_WARNING, "message"
    Journald::Native.perror "message"
```

It is not recommended to use ```print``` and ```perror``` as you may lose ```'\0'``` byte in your string due to
C zero-terminated string format (all zero bytes in the middle will be removed) On the contrary ```send``` uses
binary buffers and does not have such shortcoming.

## License

Licensed under the MIT License. See ```LICENSE.txt``` for more info