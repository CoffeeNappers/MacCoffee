.class public interface abstract Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;
.super Ljava/lang/Object;
.source "PhotoViewer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/PhotoViewer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "PhotoViewerCallback"
.end annotation


# virtual methods
.method public abstract getPhotoBounds(ILandroid/graphics/Rect;Landroid/graphics/Rect;)V
.end method

.method public abstract isMoreAvailable()Z
.end method

.method public abstract loadMore()V
.end method

.method public abstract onDismissed()V
.end method
