.class Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$1;
.super Ljava/lang/Object;
.source "HeaderPostDisplayItem.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->doAddFriend(Landroid/content/Context;ILcom/vkontakte/android/functions/F0;)V
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

.field final synthetic val$showUnSubscribe:Lcom/vkontakte/android/functions/F0;

.field final synthetic val$uid:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;Lcom/vkontakte/android/functions/F0;ILandroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;

    .prologue
    .line 276
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;

    iput-object p2, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$1;->val$showUnSubscribe:Lcom/vkontakte/android/functions/F0;

    iput p3, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$1;->val$uid:I

    iput-object p4, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 301
    new-instance v1, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$1;->val$context:Landroid/content/Context;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/vkontakte/android/AppStateTracker;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    :goto_0
    invoke-direct {v1, v0}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v0, 0x7f0801f9

    .line 302
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0801f3

    .line 303
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080479

    const/4 v2, 0x0

    .line 304
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 305
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 306
    return-void

    .line 301
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$1;->val$context:Landroid/content/Context;

    goto :goto_0
.end method

.method public success(Ljava/lang/Integer;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/Integer;

    .prologue
    .line 280
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 291
    :pswitch_0
    const/4 v0, 0x0

    .line 294
    .local v0, "friendStatus":I
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$1;->val$showUnSubscribe:Lcom/vkontakte/android/functions/F0;

    invoke-interface {v1}, Lcom/vkontakte/android/functions/F0;->f()Ljava/lang/Object;

    .line 295
    iget v1, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$1;->val$uid:I

    invoke-static {v1, v0}, Lcom/vkontakte/android/data/Friends;->notifyFriendStatusChanged(II)V

    .line 296
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;

    iget-object v1, v1, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, v1, Lcom/vkontakte/android/NewsEntry;->suggestSubscribe:Ljava/lang/Boolean;

    .line 297
    return-void

    .line 282
    .end local v0    # "friendStatus":I
    :pswitch_1
    const/4 v0, 0x1

    .line 283
    .restart local v0    # "friendStatus":I
    goto :goto_0

    .line 285
    .end local v0    # "friendStatus":I
    :pswitch_2
    const/4 v0, 0x3

    .line 286
    .restart local v0    # "friendStatus":I
    goto :goto_0

    .line 288
    .end local v0    # "friendStatus":I
    :pswitch_3
    const/4 v0, 0x1

    .line 289
    .restart local v0    # "friendStatus":I
    goto :goto_0

    .line 280
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 276
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$1;->success(Ljava/lang/Integer;)V

    return-void
.end method
