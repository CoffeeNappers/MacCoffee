.class final Lcom/vkontakte/android/stickers/KeyboardPopup$2;
.super Landroid/content/IntentFilter;
.source "KeyboardPopup.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/stickers/KeyboardPopup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 58
    invoke-direct {p0}, Landroid/content/IntentFilter;-><init>()V

    .line 59
    const-string/jumbo v0, "com.vkontakte.andoroid.HIDE_EMOJI_POPUP"

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/stickers/KeyboardPopup$2;->addAction(Ljava/lang/String;)V

    .line 60
    return-void
.end method
