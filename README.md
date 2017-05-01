# vision-smart

[![Build Status](https://travis-ci.org/vision-it/vision-smart.svg?branch=production)](https://travis-ci.org/vision-it/vision-smart)

## Parameter

* Optional[String] **vision_smart::monitoring_class:**

## Usage

Include in the *Puppetfile*:

```
mod vision_smart:
    :git => 'https://github.com/vision-it/vision-smart.git,
    :ref => 'production'
```

Include in a role/profile:

```puppet
contain ::vision_smart
```

