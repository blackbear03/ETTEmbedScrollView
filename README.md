## Introduction

**ETTEmbedScrollView** proposes to provide a solution for the scene that one scrollview ebmeds a sub-scrollview which has multi-screen content.**ETTEmbedScrollView** use
AOP design,you only have to 3 lines code to use it.

## How to use 

* First,import the **ETTEmbedScrollView** project via source code or cocoapod

* When the main scrollview scrolled, you should call the method ***ett_mainScrollViewDidScrolled*** in the ***scrollViewDidScroll:*** method body.

```Objective-C 
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    ......
    [scrollView ett_mainScrollViewDidScrolled];
    ......
    }
```

* Then, you just need to setup the ***ett_top*** of the embed scrollview and associate to the main scrollview.
***ett_top*** is always equal to the embed scrollview\`s frame.origin.y, but if you add the embed scrollview in a container vier such as UITableViewCell or UICollectionViewCell, you should set the cell\`s frame.origin.y to the ***ett_top*** of the embed scrollview.

```Objective-C 
   {
    ......
    embedScrollView.ett_top = self.frame.origin.y;
    mainScrollView.ett_embedScrollView = embedScrollView.ett_top;
    ......
    }
```
* All work has been done, only 3 lines code :).

## Next 
- [] Support embed scrollview array.
