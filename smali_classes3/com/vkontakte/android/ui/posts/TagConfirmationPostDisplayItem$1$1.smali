.class Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem$1$1;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "TagConfirmationPostDisplayItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem$1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem$1;

.field final synthetic val$v:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem$1;Landroid/content/Context;Landroid/view/View;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem$1;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 60
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem$1$1;->this$1:Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem$1;

    iput-object p3, p0, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem$1$1;->val$v:Landroid/view/View;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 2

    .prologue
    .line 63
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem$1$1;->this$1:Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem$1;

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem$1$1;->val$v:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;->access$000(Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;Landroid/content/Context;)V

    .line 64
    invoke-static {}, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;->decreasePhotosCounter()V

    .line 65
    return-void
.end method
