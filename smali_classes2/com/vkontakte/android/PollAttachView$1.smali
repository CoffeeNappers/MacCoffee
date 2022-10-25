.class Lcom/vkontakte/android/PollAttachView$1;
.super Ljava/lang/Object;
.source "PollAttachView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/PollAttachView;->onLoaded(Ljava/lang/String;I[Lcom/vkontakte/android/api/PollOption;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/PollAttachView;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/PollAttachView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/PollAttachView;

    .prologue
    .line 202
    iput-object p1, p0, Lcom/vkontakte/android/PollAttachView$1;->this$0:Lcom/vkontakte/android/PollAttachView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 205
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/PollOption;

    .line 206
    .local v1, "o":Lcom/vkontakte/android/api/PollOption;
    iget-object v2, p0, Lcom/vkontakte/android/PollAttachView$1;->this$0:Lcom/vkontakte/android/PollAttachView;

    invoke-static {v2}, Lcom/vkontakte/android/PollAttachView;->access$000(Lcom/vkontakte/android/PollAttachView;)I

    move-result v2

    if-nez v2, :cond_1

    .line 207
    iget-object v2, p0, Lcom/vkontakte/android/PollAttachView$1;->this$0:Lcom/vkontakte/android/PollAttachView;

    invoke-static {v2, v1}, Lcom/vkontakte/android/PollAttachView;->access$100(Lcom/vkontakte/android/PollAttachView;Lcom/vkontakte/android/api/PollOption;)V

    .line 216
    :cond_0
    :goto_0
    return-void

    .line 208
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/PollAttachView$1;->this$0:Lcom/vkontakte/android/PollAttachView;

    iget-boolean v2, v2, Lcom/vkontakte/android/PollAttachView;->isPublic:Z

    if-eqz v2, :cond_0

    .line 209
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 210
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v2, "title"

    iget-object v3, v1, Lcom/vkontakte/android/api/PollOption;->title:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    const-string/jumbo v2, "oid"

    iget-object v3, p0, Lcom/vkontakte/android/PollAttachView$1;->this$0:Lcom/vkontakte/android/PollAttachView;

    invoke-static {v3}, Lcom/vkontakte/android/PollAttachView;->access$200(Lcom/vkontakte/android/PollAttachView;)I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 212
    const-string/jumbo v2, "poll_id"

    iget-object v3, p0, Lcom/vkontakte/android/PollAttachView$1;->this$0:Lcom/vkontakte/android/PollAttachView;

    invoke-static {v3}, Lcom/vkontakte/android/PollAttachView;->access$300(Lcom/vkontakte/android/PollAttachView;)I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 213
    const-string/jumbo v2, "answer_id"

    iget v3, v1, Lcom/vkontakte/android/api/PollOption;->id:I

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 214
    const-class v2, Lcom/vkontakte/android/fragments/userlist/PollVotersListFragment;

    iget-object v3, p0, Lcom/vkontakte/android/PollAttachView$1;->this$0:Lcom/vkontakte/android/PollAttachView;

    invoke-virtual {v3}, Lcom/vkontakte/android/PollAttachView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v3

    invoke-static {v2, v0, v3}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    goto :goto_0
.end method
