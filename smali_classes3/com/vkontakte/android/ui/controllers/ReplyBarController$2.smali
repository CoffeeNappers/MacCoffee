.class Lcom/vkontakte/android/ui/controllers/ReplyBarController$2;
.super Ljava/lang/Object;
.source "ReplyBarController.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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

.field final synthetic val$delegate:Lcom/vkontakte/android/ui/controllers/ReplyBarController$Delegate;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/controllers/ReplyBarController;Lcom/vkontakte/android/ui/controllers/ReplyBarController$Delegate;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/controllers/ReplyBarController;

    .prologue
    .line 82
    iput-object p1, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController$2;->this$0:Lcom/vkontakte/android/ui/controllers/ReplyBarController;

    iput-object p2, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController$2;->val$delegate:Lcom/vkontakte/android/ui/controllers/ReplyBarController$Delegate;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "o"    # Landroid/view/View;

    .prologue
    .line 86
    iget-object v0, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController$2;->this$0:Lcom/vkontakte/android/ui/controllers/ReplyBarController;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->setReplyToName(Ljava/lang/String;)V

    .line 88
    iget-object v0, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController$2;->val$delegate:Lcom/vkontakte/android/ui/controllers/ReplyBarController$Delegate;

    invoke-interface {v0}, Lcom/vkontakte/android/ui/controllers/ReplyBarController$Delegate;->onTextToReset()V

    .line 90
    return-void
.end method
