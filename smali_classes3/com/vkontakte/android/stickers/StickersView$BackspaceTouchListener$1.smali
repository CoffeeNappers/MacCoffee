.class Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener$1;
.super Landroid/os/Handler;
.source "StickersView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;Landroid/os/Looper;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;
    .param p2, "x0"    # Landroid/os/Looper;

    .prologue
    .line 367
    iput-object p1, p0, Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener$1;->this$0:Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 370
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener$1;->this$0:Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;

    invoke-static {v0}, Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;->access$500(Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;)Lcom/vkontakte/android/stickers/StickersView$Listener;

    move-result-object v0

    invoke-interface {v0}, Lcom/vkontakte/android/stickers/StickersView$Listener;->onBackspace()V

    .line 371
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener$1;->this$0:Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;

    invoke-static {v0}, Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;->access$600(Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;)V

    .line 372
    return-void
.end method
