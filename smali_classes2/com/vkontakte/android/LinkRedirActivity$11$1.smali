.class Lcom/vkontakte/android/LinkRedirActivity$11$1;
.super Ljava/lang/Object;
.source "LinkRedirActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/LinkRedirActivity$11;->onUsersLoaded(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/LinkRedirActivity$11;

.field final synthetic val$users:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/LinkRedirActivity$11;Ljava/util/ArrayList;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/LinkRedirActivity$11;

    .prologue
    .line 1346
    iput-object p1, p0, Lcom/vkontakte/android/LinkRedirActivity$11$1;->this$1:Lcom/vkontakte/android/LinkRedirActivity$11;

    iput-object p2, p0, Lcom/vkontakte/android/LinkRedirActivity$11$1;->val$users:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 1349
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$11$1;->this$1:Lcom/vkontakte/android/LinkRedirActivity$11;

    iget-object v0, v0, Lcom/vkontakte/android/LinkRedirActivity$11;->val$progress:Landroid/app/ProgressDialog;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 1350
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$11$1;->val$users:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 1351
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$11$1;->this$1:Lcom/vkontakte/android/LinkRedirActivity$11;

    iget-object v1, v0, Lcom/vkontakte/android/LinkRedirActivity$11;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$11$1;->val$users:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    invoke-static {v1, v0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->start(Landroid/app/Activity;Lcom/vkontakte/android/UserProfile;)V

    .line 1355
    :goto_0
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$11$1;->this$1:Lcom/vkontakte/android/LinkRedirActivity$11;

    iget-object v0, v0, Lcom/vkontakte/android/LinkRedirActivity$11;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 1356
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$11$1;->this$1:Lcom/vkontakte/android/LinkRedirActivity$11;

    iget-object v0, v0, Lcom/vkontakte/android/LinkRedirActivity$11;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 1357
    return-void

    .line 1353
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$11$1;->this$1:Lcom/vkontakte/android/LinkRedirActivity$11;

    iget-object v0, v0, Lcom/vkontakte/android/LinkRedirActivity$11;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-static {v0}, Lcom/vkontakte/android/LinkRedirActivity;->access$400(Lcom/vkontakte/android/LinkRedirActivity;)V

    goto :goto_0
.end method
