.class public Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;
.super Ljava/lang/Object;
.source "ViewerScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/attachpicker/screen/ViewerScreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PlaceProviderObject"
.end annotation


# instance fields
.field public containerView:Landroid/view/View;

.field public entry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

.field public imageView:Lcom/vk/attachpicker/widget/LocalImageView;

.field public index:I

.field public parentView:Landroid/view/View;

.field public thumbImageHeight:I

.field public thumbImageWidth:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 780
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public hasImage()Z
    .locals 1

    .prologue
    .line 790
    iget v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->thumbImageWidth:I

    if-lez v0, :cond_0

    iget v0, p0, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->thumbImageHeight:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
