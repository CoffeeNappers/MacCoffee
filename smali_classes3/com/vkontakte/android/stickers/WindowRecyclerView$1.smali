.class Lcom/vkontakte/android/stickers/WindowRecyclerView$1;
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
    .line 54
    iput-object p1, p0, Lcom/vkontakte/android/stickers/WindowRecyclerView$1;->this$0:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 56
    iget-object v1, p0, Lcom/vkontakte/android/stickers/WindowRecyclerView$1;->this$0:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-static {v1}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->access$000(Lcom/vkontakte/android/stickers/WindowRecyclerView;)V

    .line 57
    iget-object v1, p0, Lcom/vkontakte/android/stickers/WindowRecyclerView$1;->this$0:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    iget-object v2, p0, Lcom/vkontakte/android/stickers/WindowRecyclerView$1;->this$0:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-static {v2}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->access$100(Lcom/vkontakte/android/stickers/WindowRecyclerView;)I

    move-result v2

    iget-object v3, p0, Lcom/vkontakte/android/stickers/WindowRecyclerView$1;->this$0:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-static {v3}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->access$200(Lcom/vkontakte/android/stickers/WindowRecyclerView;)I

    move-result v3

    invoke-static {v1, v2, v3}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->access$300(Lcom/vkontakte/android/stickers/WindowRecyclerView;II)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 58
    iget-object v1, p0, Lcom/vkontakte/android/stickers/WindowRecyclerView$1;->this$0:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->access$402(Lcom/vkontakte/android/stickers/WindowRecyclerView;Z)Z

    .line 59
    iget-object v1, p0, Lcom/vkontakte/android/stickers/WindowRecyclerView$1;->this$0:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->performHapticFeedback(I)Z

    .line 60
    iget-object v1, p0, Lcom/vkontakte/android/stickers/WindowRecyclerView$1;->this$0:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-static {v1}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->access$500(Lcom/vkontakte/android/stickers/WindowRecyclerView;)Landroid/view/MotionEvent;

    move-result-object v1

    invoke-static {v1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v0

    .line 61
    .local v0, "ev":Landroid/view/MotionEvent;
    iget-object v1, p0, Lcom/vkontakte/android/stickers/WindowRecyclerView$1;->this$0:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-static {v1}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->access$100(Lcom/vkontakte/android/stickers/WindowRecyclerView;)I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/vkontakte/android/stickers/WindowRecyclerView$1;->this$0:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-static {v2}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->access$200(Lcom/vkontakte/android/stickers/WindowRecyclerView;)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/view/MotionEvent;->setLocation(FF)V

    .line 62
    iget-object v1, p0, Lcom/vkontakte/android/stickers/WindowRecyclerView$1;->this$0:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-static {v1, v0}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->access$600(Lcom/vkontakte/android/stickers/WindowRecyclerView;Landroid/view/MotionEvent;)Z

    .line 63
    iget-object v1, p0, Lcom/vkontakte/android/stickers/WindowRecyclerView$1;->this$0:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-static {v1}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->access$700(Lcom/vkontakte/android/stickers/WindowRecyclerView;)V

    .line 65
    .end local v0    # "ev":Landroid/view/MotionEvent;
    :cond_0
    return-void
.end method
