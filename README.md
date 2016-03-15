# JDProgressImageView
Demo progress view with image. This is demo using Swift to make custom progress view with image.


# Tutorials

We Have many way for create progress view with this:

1. Create with 2 image

![Output sample](https://raw.githubusercontent.com/jackdao1992/JDProgressImageView/master/ProgressCustom/ProgressCustom/bottle_empty.png)
![Output sample](https://raw.githubusercontent.com/jackdao1992/JDProgressImageView/master/ProgressCustom/ProgressCustom/bottle_full.png)

```swift
progressView.frame = CGRectMake(100, 300, 100, 150)
progressView.emptyProgressImagePath = "bottle_empty.png"
progressView.fullProgressImagePath = "bottle_full.png"
progressView.ignoreTop = 0.25
progressView.ignoreBottom = 0.07
progressView.setProgress(0)
self.view.addSubview(progressView)
```

2. Create with 1 image and progress color

```swift
![Output sample](https://raw.githubusercontent.com/jackdao1992/JDProgressImageView/master/ProgressCustom/ProgressCustom/bottle_1.png)

progressView1.frame = CGRectMake(10, 260, 20, 70)
progressView1.emptyProgressImagePath = "bottle_1.png"
progressView1.fullColorProgress = UIColor.greenColor()
progressView1.setProgress(0)
self.view.addSubview(progressView1)
```

3 Create with custom color for full progress image

```swift
![Output sample](https://raw.githubusercontent.com/jackdao1992/JDProgressImageView/master/ProgressCustom/ProgressCustom/battery3_empty.png)
![Output sample](https://raw.githubusercontent.com/jackdao1992/JDProgressImageView/master/ProgressCustom/ProgressCustom/battery3_full.png)

progressBatteryView3.frame = CGRectMake(70, 320, 100, 50)
progressBatteryView3.emptyProgressImagePath = "battery3_empty.png"
progressBatteryView3.fullProgressImagePath = "battery3_full.png"
progressBatteryView3.fullColorProgress = UIColor.orangeColor()
progressBatteryView3.ignoreBottomPercent = 0.14
progressBatteryView3.ignoreTopPercent = 0.15
progressBatteryView3.isVerticalProgress = true
progressBatteryView3.setProgress(0)
self.view.addSubview(progressBatteryView3)
```
