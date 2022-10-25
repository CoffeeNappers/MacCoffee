.class Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$2;
.super Ljava/lang/Object;
.source "HeaderPostDisplayItem.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->doRemoveFriend(Landroid/content/Context;ILcom/vkontakte/android/functions/F0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$showSubscribe:Lcom/vkontakte/android/functions/F0;

.field final synthetic val$uid:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;Lcom/vkontakte/android/functions/F0;ILandroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;

    .prologue
    .line 311
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$2;->this$0:Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;

    iput-object p2, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$2;->val$showSubscribe:Lcom/vkontakte/android/functions/F0;

    iput p3, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$2;->val$uid:I

    iput-object p4, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$2;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 321
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$2;->val$context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0801f9

    .line 322
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0801f6

    .line 323
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080479

    const/4 v2, 0x0

    .line 324
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 325
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 326
    return-void
.end method

.method public success(Ljava/lang/Integer;)V
    .locals 2
    .param p1, "result"    # Ljava/lang/Integer;

    .prologue
    .line 314
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$2;->val$showSubscribe:Lcom/vkontakte/android/functions/F0;

    invoke-interface {v0}, Lcom/vkontakte/android/functions/F0;->f()Ljava/lang/Object;

    .line 315
    iget v0, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$2;->val$uid:I

    invoke-static {v0}, Lcom/vkontakte/android/data/Friends;->removeLocally(I)V

    .line 316
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$2;->this$0:Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/NewsEntry;->suggestSubscribe:Ljava/lang/Boolean;

    .line 317
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 311
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$2;->success(Ljava/lang/Integer;)V

    return-void
.end method
