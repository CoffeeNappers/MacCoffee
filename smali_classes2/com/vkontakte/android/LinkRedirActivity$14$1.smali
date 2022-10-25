.class Lcom/vkontakte/android/LinkRedirActivity$14$1;
.super Ljava/lang/Object;
.source "LinkRedirActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/LinkRedirActivity$14;->onUsersLoaded(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/LinkRedirActivity$14;

.field final synthetic val$users:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/LinkRedirActivity$14;Ljava/util/ArrayList;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/LinkRedirActivity$14;

    .prologue
    .line 1617
    iput-object p1, p0, Lcom/vkontakte/android/LinkRedirActivity$14$1;->this$1:Lcom/vkontakte/android/LinkRedirActivity$14;

    iput-object p2, p0, Lcom/vkontakte/android/LinkRedirActivity$14$1;->val$users:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 1620
    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$14$1;->val$users:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_0

    .line 1621
    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$14$1;->this$1:Lcom/vkontakte/android/LinkRedirActivity$14;

    iget-object v1, v1, Lcom/vkontakte/android/LinkRedirActivity$14;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    const v2, 0x7f0801f6

    invoke-static {v1, v2}, Lcom/vkontakte/android/LinkRedirActivity;->access$200(Lcom/vkontakte/android/LinkRedirActivity;I)V

    .line 1627
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$14$1;->this$1:Lcom/vkontakte/android/LinkRedirActivity$14;

    iget-object v1, v1, Lcom/vkontakte/android/LinkRedirActivity$14;->val$progress:Landroid/app/ProgressDialog;

    invoke-static {v1}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 1628
    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$14$1;->this$1:Lcom/vkontakte/android/LinkRedirActivity$14;

    iget-object v1, v1, Lcom/vkontakte/android/LinkRedirActivity$14;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 1629
    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$14$1;->this$1:Lcom/vkontakte/android/LinkRedirActivity$14;

    iget-object v1, v1, Lcom/vkontakte/android/LinkRedirActivity$14;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v1}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 1630
    return-void

    .line 1623
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$14$1;->val$users:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    .line 1624
    .local v0, "p":Lcom/vkontakte/android/UserProfile;
    new-instance v1, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    iget v2, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    iget-object v3, v0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-direct {v1, v2, v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;-><init>(ILjava/lang/String;)V

    iget-object v2, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->setPhoto(Ljava/lang/CharSequence;)Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/LinkRedirActivity$14$1;->this$1:Lcom/vkontakte/android/LinkRedirActivity$14;

    iget-object v2, v2, Lcom/vkontakte/android/LinkRedirActivity$14;->val$ref:Ljava/lang/String;

    .line 1625
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->setRef(Ljava/lang/String;)Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/LinkRedirActivity$14$1;->this$1:Lcom/vkontakte/android/LinkRedirActivity$14;

    iget-object v2, v2, Lcom/vkontakte/android/LinkRedirActivity$14;->val$refSource:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->setRefSource(Ljava/lang/String;)Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/LinkRedirActivity$14$1;->this$1:Lcom/vkontakte/android/LinkRedirActivity$14;

    iget-object v2, v2, Lcom/vkontakte/android/LinkRedirActivity$14;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0
.end method
