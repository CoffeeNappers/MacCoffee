.class Lcom/vkontakte/android/LinkRedirActivity$12;
.super Ljava/lang/Object;
.source "LinkRedirActivity.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/LinkRedirActivity;->onCreate(Landroid/os/Bundle;)V
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
        "Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/LinkRedirActivity;

.field final synthetic val$uri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/LinkRedirActivity;Landroid/net/Uri;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/LinkRedirActivity;

    .prologue
    .line 1362
    iput-object p1, p0, Lcom/vkontakte/android/LinkRedirActivity$12;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    iput-object p2, p0, Lcom/vkontakte/android/LinkRedirActivity$12;->val$uri:Landroid/net/Uri;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 1393
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$12;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 1394
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$12;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$12;->val$uri:Landroid/net/Uri;

    invoke-static {v0, v1}, Lcom/vkontakte/android/LinkRedirActivity;->access$000(Lcom/vkontakte/android/LinkRedirActivity;Landroid/net/Uri;)V

    .line 1395
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;)V
    .locals 7
    .param p1, "result"    # Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;

    .prologue
    .line 1365
    iget-boolean v1, p1, Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;->can_see_gifts:Z

    if-nez v1, :cond_0

    .line 1366
    new-instance v1, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v2, p0, Lcom/vkontakte/android/LinkRedirActivity$12;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-direct {v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f080294

    .line 1367
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/LinkRedirActivity$12$2;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/LinkRedirActivity$12$2;-><init>(Lcom/vkontakte/android/LinkRedirActivity$12;)V

    .line 1368
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f080479

    new-instance v3, Lcom/vkontakte/android/LinkRedirActivity$12$1;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/LinkRedirActivity$12$1;-><init>(Lcom/vkontakte/android/LinkRedirActivity$12;)V

    .line 1375
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 1380
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1389
    :goto_0
    return-void

    .line 1382
    :cond_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1383
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "user"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 1384
    const-string/jumbo v1, "title"

    iget-object v2, p0, Lcom/vkontakte/android/LinkRedirActivity$12;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v2}, Lcom/vkontakte/android/LinkRedirActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f080292

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p1, Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;->first_name_gen:Ljava/lang/String;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 1385
    const-class v1, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    iget-object v2, p0, Lcom/vkontakte/android/LinkRedirActivity$12;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-static {v1, v0, v2}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 1386
    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$12;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 1387
    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$12;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v1}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1362
    check-cast p1, Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/LinkRedirActivity$12;->success(Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;)V

    return-void
.end method
