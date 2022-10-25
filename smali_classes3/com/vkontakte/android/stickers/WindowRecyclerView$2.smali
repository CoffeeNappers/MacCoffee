.class Lcom/vkontakte/android/stickers/WindowRecyclerView$2;
.super Ljava/lang/Object;
.source "WindowRecyclerView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/stickers/WindowRecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/stickers/WindowRecyclerView;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/stickers/WindowRecyclerView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/stickers/WindowRecyclerView;

    .prologue
    .line 68
    iput-object p1, p0, Lcom/vkontakte/android/stickers/WindowRecyclerView$2;->this$0:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 71
    iget-object v1, p0, Lcom/vkontakte/android/stickers/WindowRecyclerView$2;->this$0:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-virtual {v1}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    .line 72
    .local v0, "decorView":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getWindowVisibility()I

    move-result v1

    const/16 v2, 0x8

    if-ne v1, v2, :cond_0

    .line 73
    iget-object v1, p0, Lcom/vkontakte/android/stickers/WindowRecyclerView$2;->this$0:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-static {v1}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->access$700(Lcom/vkontakte/android/stickers/WindowRecyclerView;)V

    .line 77
    :goto_0
    return-void

    .line 75
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/stickers/WindowRecyclerView$2;->this$0:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-static {v1}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->access$800(Lcom/vkontakte/android/stickers/WindowRecyclerView;)Landroid/widget/PopupWindow;

    move-result-object v1

    const/16 v2, 0x11

    invoke-virtual {v1, v0, v2, v3, v3}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    goto :goto_0
.end method
