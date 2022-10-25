.class Lcom/vkontakte/android/ui/WriteBar$7;
.super Ljava/lang/Object;
.source "WriteBar.java"

# interfaces
.implements Lcom/vkontakte/android/stickers/StickersView$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/WriteBar;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/WriteBar;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/WriteBar;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 494
    iput-object p1, p0, Lcom/vkontakte/android/ui/WriteBar$7;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBackspace()V
    .locals 0

    .prologue
    .line 513
    return-void
.end method

.method public onEmojiSelected(Ljava/lang/String;)V
    .locals 0
    .param p1, "emoji"    # Ljava/lang/String;

    .prologue
    .line 508
    return-void
.end method

.method public onStickerSelected(IILjava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "packId"    # I
    .param p2, "stickerId"    # I
    .param p3, "url"    # Ljava/lang/String;
    .param p4, "stickerReferrer"    # Ljava/lang/String;

    .prologue
    .line 498
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$7;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v0}, Lcom/vkontakte/android/ui/WriteBar;->access$3300(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/stickers/StickersView$Listener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 500
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$7;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v0}, Lcom/vkontakte/android/ui/WriteBar;->access$3200(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/ui/widget/RichEditText;

    move-result-object v0

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/widget/RichEditText;->setText(Ljava/lang/CharSequence;)V

    .line 501
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$7;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v0}, Lcom/vkontakte/android/ui/WriteBar;->access$3300(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/stickers/StickersView$Listener;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/vkontakte/android/stickers/StickersView$Listener;->onStickerSelected(IILjava/lang/String;Ljava/lang/String;)V

    .line 503
    :cond_0
    return-void
.end method
