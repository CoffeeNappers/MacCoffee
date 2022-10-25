.class Lcom/vkontakte/android/ui/controllers/ReplyBarController$1;
.super Ljava/lang/Object;
.source "ReplyBarController.java"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/controllers/ReplyBarController;-><init>(Landroid/view/View;IZLcom/vkontakte/android/ui/controllers/ReplyBarController$Delegate;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/controllers/ReplyBarController;

.field final synthetic val$replyBarView:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/controllers/ReplyBarController;Landroid/view/View;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/controllers/ReplyBarController;

    .prologue
    .line 63
    iput-object p1, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController$1;->this$0:Lcom/vkontakte/android/ui/controllers/ReplyBarController;

    iput-object p2, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController$1;->val$replyBarView:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I
    .param p6, "oldLeft"    # I
    .param p7, "oldTop"    # I
    .param p8, "oldRight"    # I
    .param p9, "oldBottom"    # I

    .prologue
    .line 66
    const-string/jumbo v0, "ReplyBarController"

    const-string/jumbo v1, "onLayoutChange"

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    iget-object v0, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController$1;->val$replyBarView:Landroid/view/View;

    new-instance v1, Lcom/vkontakte/android/ui/controllers/ReplyBarController$1$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/ui/controllers/ReplyBarController$1$1;-><init>(Lcom/vkontakte/android/ui/controllers/ReplyBarController$1;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 73
    return-void
.end method
