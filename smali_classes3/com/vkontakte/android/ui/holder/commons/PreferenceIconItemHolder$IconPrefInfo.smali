.class public Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder$IconPrefInfo;
.super Ljava/lang/Object;
.source "PreferenceIconItemHolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "IconPrefInfo"
.end annotation


# instance fields
.field final colorRes:I

.field final iconRes:I
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation
.end field

.field public final text:Ljava/lang/Object;


# direct methods
.method public constructor <init>(IILjava/lang/Object;)V
    .locals 0
    .param p1, "iconRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .param p2, "color"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param
    .param p3, "text"    # Ljava/lang/Object;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput p1, p0, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder$IconPrefInfo;->iconRes:I

    .line 35
    iput p2, p0, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder$IconPrefInfo;->colorRes:I

    .line 36
    iput-object p3, p0, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder$IconPrefInfo;->text:Ljava/lang/Object;

    .line 37
    return-void
.end method

.method public constructor <init>(ILjava/lang/Object;)V
    .locals 1
    .param p1, "iconRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .param p2, "text"    # Ljava/lang/Object;

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput p1, p0, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder$IconPrefInfo;->iconRes:I

    .line 29
    const v0, 0x106000d

    iput v0, p0, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder$IconPrefInfo;->colorRes:I

    .line 30
    iput-object p2, p0, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder$IconPrefInfo;->text:Ljava/lang/Object;

    .line 31
    return-void
.end method
