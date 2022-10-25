.class abstract Lcom/vkontakte/android/stickers/StickersViewPage;
.super Ljava/lang/Object;
.source "StickersViewPage.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method abstract getIconURL()Ljava/lang/String;
.end method

.method abstract getId()I
.end method

.method abstract getServerBackgroundURL()Ljava/lang/String;
.end method

.method abstract getTitleDrawable()Landroid/graphics/drawable/Drawable;
.end method

.method abstract getView(Landroid/content/Context;)Landroid/view/View;
.end method

.method onBottomTabsVisibilityChanged(Z)V
    .locals 0
    .param p1, "visible"    # Z

    .prologue
    .line 33
    return-void
.end method

.method abstract onConfigurationChanged(Landroid/content/res/Configuration;)V
.end method

.method abstract releaseView()V
.end method

.method abstract reload()V
.end method

.method abstract reload(Lcom/vkontakte/android/data/orm/StickerStockItem;)V
.end method
