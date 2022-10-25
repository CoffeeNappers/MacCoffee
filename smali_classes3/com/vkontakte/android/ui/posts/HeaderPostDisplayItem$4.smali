.class Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$4;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "HeaderPostDisplayItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->doLeaveGroup(Landroid/content/Context;ILcom/vkontakte/android/functions/F0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$showSubscribe:Lcom/vkontakte/android/functions/F0;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;Landroid/content/Context;Lcom/vkontakte/android/functions/F0;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 351
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$4;->this$0:Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;

    iput-object p3, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$4;->val$showSubscribe:Lcom/vkontakte/android/functions/F0;

    iput-object p4, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$4;->val$context:Landroid/content/Context;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 360
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$4;->val$context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0801f9

    .line 361
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0801f6

    .line 362
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080479

    const/4 v2, 0x0

    .line 363
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 364
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 365
    return-void
.end method

.method public success()V
    .locals 2

    .prologue
    .line 354
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$4;->this$0:Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/NewsEntry;->suggestSubscribe:Ljava/lang/Boolean;

    .line 355
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$4;->val$showSubscribe:Lcom/vkontakte/android/functions/F0;

    invoke-interface {v0}, Lcom/vkontakte/android/functions/F0;->f()Ljava/lang/Object;

    .line 356
    return-void
.end method
