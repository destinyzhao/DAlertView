# DAlertView
一款轻量级的AlertView

使用
```
DAlertView *alert =[DAlertView alertWithTitle:@"我是一个标题" message:@"文本文本文本文本文本文本文本文本文本文本文本文本文本文"];
    
    DAlertAction *action1 = [DAlertAction actionWithTitle:@"确定" style:DAlertActionStyleDefault handler:^(DAlertAction * _Nonnull action) {
        NSLog(@"点击了确定");
    }];
    
    DAlertAction *action2 = [DAlertAction actionWithTitle:@"取消" style:DAlertActionStyleDefault handler:^(DAlertAction * _Nonnull action) {
        NSLog(@"点击取消");
    }];
    
    alert.titleColor = [UIColor brownColor];
    alert.messageColor = [UIColor blueColor];
    action1.titleColor = [UIColor blueColor];
    action2.titleColor = [UIColor redColor];
    
    [alert addAction:action1];
    [alert addAction:action2];
    
    [alert show];
```

![avatar](https://upload-images.jianshu.io/upload_images/2416132-e24bcbb6d6e050a8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/828/format/webp)

pod 'DAlertView'
