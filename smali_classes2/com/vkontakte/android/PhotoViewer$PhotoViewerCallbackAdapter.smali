.class public Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallbackAdapter;
.super Ljava/lang/Object;
.source "PhotoViewer.java"

# interfaces
.implements Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/PhotoViewer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PhotoViewerCallbackAdapter"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 1160
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getPhotoBounds(ILandroid/graphics/Rect;Landroid/graphics/Rect;)V
    .locals 0
    .param p1, "index"    # I
    .param p2, "outRect"    # Landroid/graphics/Rect;
    .param p3, "outClip"    # Landroid/graphics/Rect;

    .prologue
    .line 1162
    return-void
.end method

.method public isMoreAvailable()Z
    .locals 1

    .prologue
    .line 1165
    const/4 v0, 0x0

    return v0
.end method

.method public loadMore()V
    .locals 0

    .prologue
    .line 1169
    return-void
.end method

.method public onDismissed()V
    .locals 0

    .prologue
    .line 1174
    return-void
.end method
