.class Lcom/vkontakte/android/stickers/StickerEmojiPage$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "StickerEmojiPage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/stickers/StickerEmojiPage;->onBottomTabsVisibilityChanged(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/stickers/StickerEmojiPage;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/stickers/StickerEmojiPage;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/stickers/StickerEmojiPage;

    .prologue
    .line 114
    iput-object p1, p0, Lcom/vkontakte/android/stickers/StickerEmojiPage$1;->this$0:Lcom/vkontakte/android/stickers/StickerEmojiPage;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 117
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerEmojiPage$1;->this$0:Lcom/vkontakte/android/stickers/StickerEmojiPage;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/vkontakte/android/stickers/StickerEmojiPage;->currentTabsAnimation:Landroid/animation/ObjectAnimator;

    .line 118
    return-void
.end method
