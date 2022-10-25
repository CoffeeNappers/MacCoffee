.class Lcom/vkontakte/android/LinkRedirActivity$15$1;
.super Ljava/lang/Object;
.source "LinkRedirActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/LinkRedirActivity$15;->onUsersLoaded(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/LinkRedirActivity$15;

.field final synthetic val$title:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/LinkRedirActivity$15;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/LinkRedirActivity$15;

    .prologue
    .line 1638
    iput-object p1, p0, Lcom/vkontakte/android/LinkRedirActivity$15$1;->this$1:Lcom/vkontakte/android/LinkRedirActivity$15;

    iput-object p2, p0, Lcom/vkontakte/android/LinkRedirActivity$15$1;->val$title:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 1641
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$15$1;->this$1:Lcom/vkontakte/android/LinkRedirActivity$15;

    iget-object v0, v0, Lcom/vkontakte/android/LinkRedirActivity$15;->val$progress:Landroid/app/ProgressDialog;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 1642
    new-instance v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$15$1;->this$1:Lcom/vkontakte/android/LinkRedirActivity$15;

    iget v1, v1, Lcom/vkontakte/android/LinkRedirActivity$15;->val$uid:I

    iget-object v2, p0, Lcom/vkontakte/android/LinkRedirActivity$15$1;->val$title:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;-><init>(ILjava/lang/String;)V

    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$15$1;->this$1:Lcom/vkontakte/android/LinkRedirActivity$15;

    iget-object v1, v1, Lcom/vkontakte/android/LinkRedirActivity$15;->val$ref:Ljava/lang/String;

    .line 1643
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->setRef(Ljava/lang/String;)Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$15$1;->this$1:Lcom/vkontakte/android/LinkRedirActivity$15;

    iget-object v1, v1, Lcom/vkontakte/android/LinkRedirActivity$15;->val$refSource:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->setRefSource(Ljava/lang/String;)Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$15$1;->this$1:Lcom/vkontakte/android/LinkRedirActivity$15;

    iget-object v1, v1, Lcom/vkontakte/android/LinkRedirActivity$15;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->go(Landroid/content/Context;)Z

    .line 1644
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$15$1;->this$1:Lcom/vkontakte/android/LinkRedirActivity$15;

    iget-object v0, v0, Lcom/vkontakte/android/LinkRedirActivity$15;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 1645
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$15$1;->this$1:Lcom/vkontakte/android/LinkRedirActivity$15;

    iget-object v0, v0, Lcom/vkontakte/android/LinkRedirActivity$15;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 1646
    return-void
.end method
