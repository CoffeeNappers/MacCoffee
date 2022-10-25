.class Lcom/vkontakte/android/attachments/PollAttachment$1;
.super Ljava/lang/Object;
.source "PollAttachment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/attachments/PollAttachment;->bindView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/attachments/PollAttachment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/attachments/PollAttachment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/attachments/PollAttachment;

    .prologue
    .line 118
    iput-object p1, p0, Lcom/vkontakte/android/attachments/PollAttachment$1;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 121
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/PollAttachment$Answer;

    .line 122
    .local v0, "a":Lcom/vkontakte/android/attachments/PollAttachment$Answer;
    iget-object v2, p0, Lcom/vkontakte/android/attachments/PollAttachment$1;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    iget v2, v2, Lcom/vkontakte/android/attachments/PollAttachment;->userAnswer:I

    if-nez v2, :cond_1

    .line 123
    iget-object v3, p0, Lcom/vkontakte/android/attachments/PollAttachment$1;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-static {v3, v0, v2}, Lcom/vkontakte/android/attachments/PollAttachment;->access$000(Lcom/vkontakte/android/attachments/PollAttachment;Lcom/vkontakte/android/attachments/PollAttachment$Answer;Landroid/view/ViewGroup;)V

    .line 132
    :cond_0
    :goto_0
    return-void

    .line 124
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/attachments/PollAttachment$1;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    iget-boolean v2, v2, Lcom/vkontakte/android/attachments/PollAttachment;->isAnonymous:Z

    if-nez v2, :cond_0

    .line 125
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 126
    .local v1, "args":Landroid/os/Bundle;
    const-string/jumbo v2, "title"

    iget-object v3, v0, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->text:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    const-string/jumbo v2, "oid"

    iget-object v3, p0, Lcom/vkontakte/android/attachments/PollAttachment$1;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    iget v3, v3, Lcom/vkontakte/android/attachments/PollAttachment;->oid:I

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 128
    const-string/jumbo v2, "poll_id"

    iget-object v3, p0, Lcom/vkontakte/android/attachments/PollAttachment$1;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    iget v3, v3, Lcom/vkontakte/android/attachments/PollAttachment;->pid:I

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 129
    const-string/jumbo v2, "answer_id"

    iget v3, v0, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->id:I

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 130
    const-class v2, Lcom/vkontakte/android/fragments/userlist/PollVotersListFragment;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v2, v1, v3}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    goto :goto_0
.end method
