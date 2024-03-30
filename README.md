# ETable [![Paypal logo](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=TAWNECQR3TTUY)

> [!NOTE]  
> This package was an experiment to bring some structured table rendering to Emacs.  The interface ended up being too complicated (direct port from Java) and un-Emacsy and didn't gain a lot of traction.  I am archiving this repository for future inspiration, but won't work on this anymore (with the recent changes to EIEIO it no longer works without tweaking the code somewhat).  If anyone is interested, drop me an email and we can discuss further work around the subject.

A JTable for emacs, because it's about time there's a solid, reusable, and flexible enough table rendering package for emacs.

Many packages in emacs simply show you tabular data (ibuffer, dired, many help views).  If a third party wants to implement a table view, they also have to reimplement all the formatting, sorting, column ordering, editing features, because the existing solutions are utterly inflexible.  This package is modeled after [JTable](http://docs.oracle.com/javase/7/docs/api/javax/swing/JTable.html) and friends, a part of Java swing GUI system.  Swing has a fame of being overly abstract and difficult to use, but with proper default implementations (and it provides plenty) it is very simple to use and very flexible to extend, just in the emacs spirit!

# How to use

ETable uses strict separation of view and data.  Views are only concerned with displaying "abstract data", while these are provided by Model objects.  This can be viewed as a variation of [MVC design pattern](http://en.wikipedia.org/wiki/Model–view–controller).

Here's a screenshot showing off some features:

![Demo1](http://i.imgur.com/U2YB4LB.png)

# Relation to org-mode tables, orgtbl-mode and similar

This package is not concerned with tables in the org mode sense (that is to serve as an intermediate format for tabular data for later export/processing).  The first and foremost goal is to provide a framework to *present* data to the user, enable her to filter, sort, search, select and copy the data, edit cells, reorder columns and just do all the things we are used to from the classic GUI interfaces.  A possible use-case is display of directory data (aka dired), buffers (aka ibuffer), or any other tabular data, where the org markup would be needless and outright confusing/inconvenient.

# How to contribute

If you are familiar with JTable and swing (or philosophically similar framework) and want to contribute to this project, please email me or start an issue so we can dicuss what work needs to be done to minimze the possibility of several people doing the same work.
