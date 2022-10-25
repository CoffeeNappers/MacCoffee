.class Lcom/vkontakte/android/ui/controllers/ReplyBarController$1$1;
.super Ljava/lang/Object;
.source "ReplyBarController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/controllers/ReplyBarController$1;->onLayoutChange(Landroid/view/View;IIIIIIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/ui/controllers/ReplyBarController$1;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/controllers/ReplyBarController$1;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/ui/controllers/ReplyBarController$1;

    .prologue
    .line 67
    iput-object p1, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController$1$1;->this$1:Lcom/vkontakte/android/ui/controllers/ReplyBarController$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController$1$1;->this$1:Lcom/vkontakte/android/ui/controllers/ReplyBarController$1;

    iget-object v0, v0, Lcom/vkontakte/android/ui/controllers/ReplyBarController$1;->this$0:Lcom/vkontakte/android/ui/controllers/ReplyBarController;

    invoke-static {v0}, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->access$000(Lcom/vkontakte/android/ui/controllers/ReplyBarController;)V

    .line 71
    return-void
.end method
