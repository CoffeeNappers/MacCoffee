.class Lcom/vkontakte/android/ui/controllers/ReplyBarController$3;
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
    .line 93
    iput-object p1, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController$3;->this$0:Lcom/vkontakte/android/ui/controllers/ReplyBarController;

    iput-object p2, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController$3;->val$delegate:Lcom/vkontakte/android/ui/controllers/ReplyBarController$Delegate;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "o"    # Landroid/view/View;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController$3;->val$delegate:Lcom/vkontakte/android/ui/controllers/ReplyBarController$Delegate;

    invoke-interface {v0}, Lcom/vkontakte/android/ui/controllers/ReplyBarController$Delegate;->onTextFromClick()V

    .line 97
    return-void
.end method
