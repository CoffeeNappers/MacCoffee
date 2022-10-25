.class Lcom/vkontakte/android/fragments/WikiViewFragment$WebCallback$1;
.super Ljava/lang/Object;
.source "WikiViewFragment.java"

# interfaces
.implements Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/WikiViewFragment$WebCallback;->lambda$openPhotos$0([Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/WikiViewFragment$WebCallback;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/WikiViewFragment$WebCallback;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/WikiViewFragment$WebCallback;

    .prologue
    .line 390
    iput-object p1, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$WebCallback$1;->this$1:Lcom/vkontakte/android/fragments/WikiViewFragment$WebCallback;

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
    .line 394
    return-void
.end method

.method public isMoreAvailable()Z
    .locals 1

    .prologue
    .line 398
    const/4 v0, 0x0

    return v0
.end method

.method public loadMore()V
    .locals 0

    .prologue
    .line 404
    return-void
.end method

.method public onDismissed()V
    .locals 0

    .prologue
    .line 409
    return-void
.end method
